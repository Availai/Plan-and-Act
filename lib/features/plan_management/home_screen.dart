import 'package:flutter/material.dart';
import 'package:planandact/core/storage_service.dart';

import 'add_plan_sheet.dart';
import 'plan_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PlanModel> myPlans = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSavedPlans();
  }

  Future<void> _loadSavedPlans() async {
    final savedPlans = await StorageService.loadPlans();
    setState(() {
      myPlans = savedPlans..sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
      isLoading = false;
    });
  }

  Future<void> _openAddSheet() async {
    final result = await showModalBottomSheet<PlanModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddPlanSheet(),
    );

    if (result != null) {
      setState(() {
        myPlans.add(result);
        myPlans.sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
      });
      await StorageService.savePlans(myPlans);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final todayCount = myPlans.where((plan) {
      final t = plan.scheduledTime;
      return t.year == now.year && t.month == now.month && t.day == now.day;
    }).length;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddSheet,
        icon: const Icon(Icons.auto_awesome_rounded),
        label: const Text('Yeni Plan'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0B1021), Color(0xFF101934), Color(0xFF0E1328)],
          ),
        ),
        child: SafeArea(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: _loadSavedPlans,
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: _HeroPanel(
                            totalPlanCount: myPlans.length,
                            todayCount: todayCount,
                          ),
                        ),
                      ),
                      if (myPlans.isEmpty)
                        const SliverFillRemaining(
                          hasScrollBody: false,
                          child: _EmptyState(),
                        )
                      else
                        SliverPadding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 110),
                          sliver: SliverList.separated(
                            itemBuilder: (context, index) {
                              final plan = myPlans[index];
                              return _PlanCard(plan: plan, index: index, colorScheme: theme.colorScheme);
                            },
                            separatorBuilder: (_, _) => const SizedBox(height: 12),
                            itemCount: myPlans.length,
                          ),
                        ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel({required this.totalPlanCount, required this.todayCount});

  final int totalPlanCount;
  final int todayCount;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w800,
      letterSpacing: 0.2,
    );

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFF5C6CFF), Color(0xFF8562FF), Color(0xFFBD61FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(color: Color(0x4D5D6DFF), blurRadius: 24, offset: Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.rocket_launch_rounded, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text('Plan and Act', style: titleStyle?.copyWith(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            'Bugün için hedeflerini belirle, harekete geç ve motivasyonunu yüksek tut.',
            style: TextStyle(color: Colors.white, height: 1.4),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _StatBadge(label: 'Toplam Plan', value: '$totalPlanCount'),
              _StatBadge(label: 'Bugün', value: '$todayCount'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  const _StatBadge({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white.withValues(alpha: 0.22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({required this.plan, required this.index, required this.colorScheme});

  final PlanModel plan;
  final int index;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final description = plan.description.trim();
    final wisdom = plan.assignedWisdom?.trim();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            colorScheme.surfaceContainerHighest.withValues(alpha: 0.92),
            colorScheme.surfaceContainer.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primary.withValues(alpha: 0.2),
                  ),
                  child: Text('${index + 1}', style: const TextStyle(fontWeight: FontWeight.w700)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    plan.title,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(width: 8),
                _TimePill(dateTime: plan.scheduledTime),
              ],
            ),
            if (description.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(color: colorScheme.onSurfaceVariant, height: 1.35),
              ),
            ],
            if (wisdom != null && wisdom.isNotEmpty) ...[
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: colorScheme.primaryContainer.withValues(alpha: 0.35),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.lightbulb_rounded, size: 18, color: colorScheme.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        wisdom,
                        style: TextStyle(color: colorScheme.onSurface, fontSize: 13.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TimePill extends StatelessWidget {
  const _TimePill({required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final hh = dateTime.hour.toString().padLeft(2, '0');
    final mm = dateTime.minute.toString().padLeft(2, '0');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
      ),
      child: Text('$hh:$mm', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary.withValues(alpha: 0.5),
                  colorScheme.tertiary.withValues(alpha: 0.45),
                ],
              ),
            ),
            child: const Icon(Icons.calendar_month_rounded, size: 46),
          ),
          const SizedBox(height: 20),
          const Text(
            'Harika bir başlangıç için ilk planını ekle ✨',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            '“Yeni Plan” butonuna dokun ve bugününü organize etmeye başla.',
            textAlign: TextAlign.center,
            style: TextStyle(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
