import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/features/planning/application/providers/plan_repository_provider.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';
import 'package:planandact/shared/presentation/widgets/empty_state_view.dart';

/// Summary of a user's momentum: streaks, completion density, totals.
class _MomentumStats {
  _MomentumStats({
    required this.currentStreak,
    required this.longestStreak,
    required this.totalCompleted,
    required this.thisWeek,
    required this.thisMonth,
    required this.dailyCounts,
  });

  final int currentStreak;
  final int longestStreak;
  final int totalCompleted;
  final int thisWeek;
  final int thisMonth;
  /// Map of date (normalized to midnight) -> completed count.
  final Map<DateTime, int> dailyCounts;
}

DateTime _norm(DateTime d) => DateTime(d.year, d.month, d.day);

final _momentumStatsProvider =
    FutureProvider.autoDispose<_MomentumStats>((ref) async {
  final repo = ref.watch(planRepositoryProvider);
  final result = await repo.getAllPlans('local_user');

  final List<PlanEntity> all = switch (result) {
    Success(:final value) => value,
    Err() => <PlanEntity>[],
  };

  final completed = all
      .where((p) => p.status == PlanStatus.completed && p.completedAt != null)
      .toList();

  final daily = <DateTime, int>{};
  for (final p in completed) {
    final d = _norm(p.completedAt!);
    daily[d] = (daily[d] ?? 0) + 1;
  }

  // Streak calculation — consecutive days ending today or yesterday.
  final today = _norm(DateTime.now());
  int current = 0;
  var cursor = today;
  // Allow streak to start from yesterday if today is not yet marked.
  if (!daily.containsKey(cursor) && daily.containsKey(today.subtract(const Duration(days: 1)))) {
    cursor = today.subtract(const Duration(days: 1));
  }
  while (daily.containsKey(cursor)) {
    current += 1;
    cursor = cursor.subtract(const Duration(days: 1));
  }

  // Longest streak across all history.
  int longest = 0;
  if (daily.isNotEmpty) {
    final sorted = daily.keys.toList()..sort();
    int run = 1;
    longest = 1;
    for (int i = 1; i < sorted.length; i++) {
      final diff = sorted[i].difference(sorted[i - 1]).inDays;
      if (diff == 1) {
        run += 1;
        if (run > longest) longest = run;
      } else {
        run = 1;
      }
    }
  }

  final weekStart = today.subtract(Duration(days: today.weekday - 1));
  final monthStart = DateTime(today.year, today.month, 1);
  int weekCount = 0;
  int monthCount = 0;
  daily.forEach((date, n) {
    if (!date.isBefore(weekStart)) weekCount += n;
    if (!date.isBefore(monthStart)) monthCount += n;
  });

  return _MomentumStats(
    currentStreak: current,
    longestStreak: longest,
    totalCompleted: completed.length,
    thisWeek: weekCount,
    thisMonth: monthCount,
    dailyCounts: daily,
  );
});

class MomentumScreen extends ConsumerWidget {
  const MomentumScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(_momentumStatsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Momentum')),
      body: AppBackdrop(
        child: statsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Text('Hata: $e',
                style: const TextStyle(color: AppColors.danger)),
          ),
          data: (stats) {
            if (stats.totalCompleted == 0) {
              return const Padding(
                padding: EdgeInsets.all(24),
                child: EmptyStateView(
                  title: 'Henuz momentum yok',
                  message:
                      'Ilk planini tamamladiginda buraya bir alev yerlesir ve her gun busyudur.',
                  icon: Icons.local_fire_department_rounded,
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async => ref.invalidate(_momentumStatsProvider),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
                children: [
                  _StreakFlame(streak: stats.currentStreak),
                  const SizedBox(height: 28),
                  _StatRow(stats: stats),
                  const SizedBox(height: 28),
                  const _SectionTitle(
                    icon: Icons.grid_view_rounded,
                    title: 'Son 12 hafta',
                    subtitle: 'Her kutu bir gun — parlak oldukca daha cok bitmis plan.',
                  ),
                  const SizedBox(height: 14),
                  _Heatmap(dailyCounts: stats.dailyCounts),
                  const SizedBox(height: 14),
                  const _HeatmapLegend(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Animated flame whose size and glow scale with streak count.
class _StreakFlame extends StatefulWidget {
  const _StreakFlame({required this.streak});
  final int streak;

  @override
  State<_StreakFlame> createState() => _StreakFlameState();
}

class _StreakFlameState extends State<_StreakFlame>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Flame scale: cap visually at ~30 day streak.
    final intensity = math.min(widget.streak, 30) / 30.0;
    final size = 80 + 60 * intensity;
    final flameColor = widget.streak >= 14
        ? AppColors.accentPink
        : widget.streak >= 7
            ? AppColors.warning
            : AppColors.accentCyan;

    return Column(
      children: [
        AnimatedBuilder(
          animation: _pulse,
          builder: (context, _) {
            final breathe = 0.92 + 0.08 * _pulse.value;
            return Container(
              width: size + 40,
              height: size + 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    flameColor.withValues(alpha: 0.35 * breathe),
                    flameColor.withValues(alpha: 0.0),
                  ],
                ),
              ),
              child: Transform.scale(
                scale: breathe,
                child: Icon(
                  Icons.local_fire_department_rounded,
                  size: size,
                  color: flameColor,
                  shadows: [
                    Shadow(
                      color: flameColor.withValues(alpha: 0.9),
                      blurRadius: 24,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        Text(
          '${widget.streak}',
          style: TextStyle(
            color: flameColor,
            fontSize: 44,
            fontWeight: FontWeight.w800,
            height: 1,
            shadows: [
              Shadow(color: flameColor.withValues(alpha: 0.5), blurRadius: 16),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.streak == 1 ? 'gunluk seri' : 'gunluk seri',
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 13,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.stats});
  final _MomentumStats stats;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            label: 'Bu hafta',
            value: '${stats.thisWeek}',
            icon: Icons.view_week_rounded,
            color: AppColors.accentCyan,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatCard(
            label: 'Bu ay',
            value: '${stats.thisMonth}',
            icon: Icons.calendar_month_rounded,
            color: AppColors.accentPurple,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatCard(
            label: 'En uzun',
            value: '${stats.longestStreak}',
            icon: Icons.emoji_events_rounded,
            color: AppColors.warning,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.panelBackground.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.accentCyan, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 2),
              Text(subtitle,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 12,
                    height: 1.3,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class _Heatmap extends StatelessWidget {
  const _Heatmap({required this.dailyCounts});
  final Map<DateTime, int> dailyCounts;

  static const _weeks = 12;
  static const _days = 7;

  @override
  Widget build(BuildContext context) {
    final today = _norm(DateTime.now());
    // Anchor: end of current week (Sunday). Walk backwards.
    final endOfWeek = today.add(Duration(days: _days - today.weekday));
    final maxCount = dailyCounts.values.isEmpty
        ? 0
        : dailyCounts.values.reduce(math.max);

    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 4.0;
        final cell = (constraints.maxWidth - spacing * (_weeks - 1)) / _weeks;

        return SizedBox(
          height: cell * _days + spacing * (_days - 1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(_weeks, (w) {
              final weekEnd = endOfWeek
                  .subtract(Duration(days: (_weeks - 1 - w) * _days));
              return Padding(
                padding: EdgeInsets.only(right: w == _weeks - 1 ? 0 : spacing),
                child: Column(
                  children: List.generate(_days, (d) {
                    // Row d=0 is Monday, d=6 is Sunday.
                    final day = weekEnd.subtract(Duration(days: _days - 1 - d));
                    final isFuture = day.isAfter(today);
                    final count = dailyCounts[_norm(day)] ?? 0;
                    return Padding(
                      padding: EdgeInsets.only(bottom: d == _days - 1 ? 0 : spacing),
                      child: Tooltip(
                        message: isFuture
                            ? ''
                            : '${day.day}.${day.month}: $count tamamlandi',
                        child: Container(
                          width: cell,
                          height: cell,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: _cellColor(count, maxCount, isFuture),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  Color _cellColor(int count, int max, bool isFuture) {
    if (isFuture) return AppColors.panelBackground.withValues(alpha: 0.3);
    if (count == 0) return AppColors.panelElevated.withValues(alpha: 0.6);
    if (max == 0) return AppColors.panelElevated;

    final ratio = (count / max).clamp(0.0, 1.0);
    // Bucket into 4 intensity levels so tiny diffs still read clearly.
    if (ratio <= 0.25) return AppColors.success.withValues(alpha: 0.35);
    if (ratio <= 0.5) return AppColors.success.withValues(alpha: 0.55);
    if (ratio <= 0.75) return AppColors.success.withValues(alpha: 0.8);
    return AppColors.success;
  }
}

class _HeatmapLegend extends StatelessWidget {
  const _HeatmapLegend();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Az',
            style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
        const SizedBox(width: 6),
        _LegendBox(color: AppColors.panelElevated.withValues(alpha: 0.6)),
        _LegendBox(color: AppColors.success.withValues(alpha: 0.35)),
        _LegendBox(color: AppColors.success.withValues(alpha: 0.55)),
        _LegendBox(color: AppColors.success.withValues(alpha: 0.8)),
        _LegendBox(color: AppColors.success),
        const SizedBox(width: 6),
        const Text('Cok',
            style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
      ],
    );
  }
}

class _LegendBox extends StatelessWidget {
  const _LegendBox({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
