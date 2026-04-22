import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:planandact/app/router/route_names.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/presentation/providers/today_dashboard_providers.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';
import 'package:planandact/shared/presentation/widgets/empty_state_view.dart';

/// "Karar Carki" — spin-a-wheel to break decision paralysis.
///
/// Picks one actionable plan from today at random with a decelerating
/// spin animation. Surfaces the chosen plan as a focus card.
class StuckScreen extends ConsumerStatefulWidget {
  const StuckScreen({super.key});

  @override
  ConsumerState<StuckScreen> createState() => _StuckScreenState();
}

class _StuckScreenState extends ConsumerState<StuckScreen>
    with SingleTickerProviderStateMixin {
  static const _wheelPalette = <Color>[
    AppColors.accentCyan,
    AppColors.accentPink,
    AppColors.accentPurple,
    AppColors.warning,
    AppColors.success,
  ];

  late final AnimationController _spinController;
  late Animation<double> _spinAnimation;
  final _random = math.Random();
  double _rotation = 0;
  int? _landedIndex;
  bool _spinning = false;

  @override
  void initState() {
    super.initState();
    _spinController = AnimationController(vsync: this);
    _spinAnimation = AlwaysStoppedAnimation(0);
    _spinController.addListener(() {
      setState(() => _rotation = _spinAnimation.value);
    });
    _spinController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        HapticFeedback.mediumImpact();
        setState(() => _spinning = false);
      }
    });
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
  }

  void _spin(int segmentCount) {
    if (_spinning || segmentCount == 0) return;
    HapticFeedback.selectionClick();

    final sweep = 2 * math.pi / segmentCount;
    // Pick a target segment; add 4-6 full rotations for drama.
    final target = _random.nextInt(segmentCount);
    final fullTurns = 4 + _random.nextInt(3);
    // Wheel rotates; pointer at top (-pi/2). Land with segment center under pointer.
    final segmentCenter = sweep * target + sweep / 2;
    final endRotation = (_rotation ~/ (2 * math.pi) + fullTurns) * 2 * math.pi +
        (2 * math.pi - segmentCenter);

    _spinAnimation = Tween<double>(
      begin: _rotation,
      end: endRotation,
    ).animate(CurvedAnimation(
      parent: _spinController,
      curve: Curves.decelerate,
    ));

    setState(() {
      _spinning = true;
      _landedIndex = target;
    });
    _spinController
      ..duration = Duration(milliseconds: 2600 + _random.nextInt(900))
      ..forward(from: 0);
  }

  void _reset() {
    setState(() {
      _landedIndex = null;
      _rotation = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final plansAsync = ref.watch(selectedDatePlansProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Karar Carki'),
        actions: [
          if (_landedIndex != null && !_spinning)
            IconButton(
              tooltip: 'Sifirla',
              icon: const Icon(Icons.refresh_rounded),
              onPressed: _reset,
            ),
        ],
      ),
      body: AppBackdrop(
        child: plansAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Text('Planlar yuklenemedi: $e',
                style: const TextStyle(color: AppColors.danger)),
          ),
          data: (plans) {
            final actionable =
                plans.where((p) => p.status.isActionable).toList();

            if (actionable.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(24),
                child: EmptyStateView(
                  title: 'Cevirecek bir sey yok',
                  message:
                      'Bugun icin aktif plan bulunmuyor. Once bir plan ekle, sonra takildiginda carki cevir.',
                  icon: Icons.pie_chart_outline_rounded,
                ),
              );
            }

            // Clamp index in case plans mutate mid-spin.
            final landed = _landedIndex != null && !_spinning
                ? actionable[_landedIndex! % actionable.length]
                : null;

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _HeaderHint(),
                  const SizedBox(height: 20),
                  Center(
                    child: _Wheel(
                      plans: actionable,
                      rotation: _rotation,
                      palette: _wheelPalette,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: FilledButton.icon(
                      onPressed: _spinning ? null : () => _spin(actionable.length),
                      icon: Icon(_spinning
                          ? Icons.autorenew_rounded
                          : Icons.casino_rounded),
                      label: Text(_spinning ? 'Cevriliyor...' : 'Cevir'),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  if (landed != null) _LandedPlanCard(plan: landed),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HeaderHint extends StatelessWidget {
  const _HeaderHint();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.panelBackground.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: const Row(
        children: [
          Icon(Icons.psychology_alt_rounded,
              color: AppColors.accentPurple, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Takildin mi? Cark senin yerine karar versin. Bugunun aktif planlarindan birini rastgele secer — sen sadece baslat.',
              style: TextStyle(color: AppColors.textSecondary, height: 1.35),
            ),
          ),
        ],
      ),
    );
  }
}

class _Wheel extends StatelessWidget {
  const _Wheel({
    required this.plans,
    required this.rotation,
    required this.palette,
  });

  final List<PlanEntity> plans;
  final double rotation;
  final List<Color> palette;

  @override
  Widget build(BuildContext context) {
    const size = 300.0;
    return SizedBox(
      width: size,
      height: size + 24,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Pointer
          Positioned(
            top: 0,
            child: CustomPaint(
              size: const Size(24, 24),
              painter: _PointerPainter(),
            ),
          ),
          Positioned(
            top: 20,
            child: Transform.rotate(
              angle: rotation,
              child: CustomPaint(
                size: const Size(size, size),
                painter: _WheelPainter(plans: plans, palette: palette),
              ),
            ),
          ),
          // Center hub
          Positioned(
            top: 20 + size / 2 - 18,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.panelElevated,
                border: Border.all(color: AppColors.accentCyan, width: 2),
              ),
              child: const Icon(Icons.bolt_rounded,
                  color: AppColors.accentCyan, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class _PointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width / 2, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(
      path,
      Paint()..color = AppColors.accentPink,
    );
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..color = AppColors.pageBackground,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _WheelPainter extends CustomPainter {
  _WheelPainter({required this.plans, required this.palette});

  final List<PlanEntity> plans;
  final List<Color> palette;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final sweep = 2 * math.pi / plans.length;

    for (var i = 0; i < plans.length; i++) {
      final start = sweep * i - math.pi / 2;
      final color = palette[i % palette.length];

      canvas.drawArc(
        rect,
        start,
        sweep,
        true,
        Paint()
          ..style = PaintingStyle.fill
          ..shader = RadialGradient(
            colors: [color.withValues(alpha: 0.95), color.withValues(alpha: 0.6)],
          ).createShader(rect),
      );
      canvas.drawArc(
        rect,
        start,
        sweep,
        true,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = AppColors.pageBackground,
      );

      _paintLabel(canvas, center, radius, start + sweep / 2, plans[i].title);
    }

    // Outer ring
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = AppColors.accentCyan.withValues(alpha: 0.6),
    );
  }

  void _paintLabel(
      Canvas canvas, Offset center, double radius, double angle, String text) {
    final labelRadius = radius * 0.62;
    final pos = Offset(
      center.dx + labelRadius * math.cos(angle),
      center.dy + labelRadius * math.sin(angle),
    );

    final display = text.length > 14 ? '${text.substring(0, 13)}…' : text;

    final painter = TextPainter(
      text: TextSpan(
        text: display,
        style: const TextStyle(
          color: AppColors.pageBackground,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: radius * 0.8);

    canvas.save();
    canvas.translate(pos.dx, pos.dy);
    // Rotate so text aligns along radial direction, keep upright on lower half.
    var rot = angle;
    if (rot > math.pi / 2 && rot < 3 * math.pi / 2) {
      rot += math.pi;
    }
    canvas.rotate(rot);
    painter.paint(canvas, Offset(-painter.width / 2, -painter.height / 2));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _WheelPainter oldDelegate) =>
      oldDelegate.plans != plans;
}

class _LandedPlanCard extends StatelessWidget {
  const _LandedPlanCard({required this.plan});

  final PlanEntity plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.panelElevated,
            AppColors.panelBackground,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accentPink, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentPink.withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.my_location_rounded,
                  color: AppColors.accentPink, size: 20),
              const SizedBox(width: 8),
              Text(
                'Cark bunu secti',
                style: TextStyle(
                  color: AppColors.accentPink,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            plan.title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          if (plan.description.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              plan.description,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.schedule_rounded,
                  size: 16, color: AppColors.textMuted),
              const SizedBox(width: 6),
              Text(
                plan.scheduledTimeLocal,
                style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
              ),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: () =>
                    context.push(RouteNames.planDetailPath(plan.id)),
                icon: const Icon(Icons.open_in_new_rounded, size: 16),
                label: const Text('Detay'),
              ),
              const SizedBox(width: 8),
              FilledButton.icon(
                onPressed: () =>
                    context.push(RouteNames.focusPath(plan.id)),
                icon: const Icon(Icons.center_focus_strong_rounded),
                label: const Text('Odaklan'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
