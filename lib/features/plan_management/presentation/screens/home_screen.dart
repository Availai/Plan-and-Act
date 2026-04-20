import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/plan_management/application/providers/plans_provider.dart';
import 'package:planandact/features/plan_management/domain/entities/plan.dart';
import 'package:planandact/features/plan_management/presentation/widgets/add_plan_sheet.dart';
import 'package:planandact/features/wisdom_engine/wisdom_service.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  Future<void> _openAddSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddPlanSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final plansAsync = ref.watch(plansProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openAddSheet(context),
        icon: const Icon(Icons.add_task_rounded),
        label: const Text('Yeni Plan'),
      ),
      body: plansAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Hata: $error')),
        data: (plans) {
          final pages = [
            _TodayDashboard(plans: plans),
            _ReflectionScreen(plans: plans),
            _MomentumView(plans: plans),
            _StuckDetection(plans: plans),
          ];

          return SafeArea(child: pages[_currentIndex]);
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.today_rounded), label: 'Today'),
          NavigationDestination(icon: Icon(Icons.self_improvement_rounded), label: 'Reflection'),
          NavigationDestination(icon: Icon(Icons.bolt_rounded), label: 'Momentum'),
          NavigationDestination(icon: Icon(Icons.warning_amber_rounded), label: 'Stuck'),
        ],
      ),
    );
  }
}

class _TodayDashboard extends ConsumerWidget {
  const _TodayDashboard({required this.plans});

  final List<Plan> plans;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final todayPlans = plans.where((plan) => _isSameDay(plan.scheduledTime, now)).toList();
    final completedToday =
        todayPlans.where((plan) => plan.status == PlanStatus.completed).length;
    final progress = todayPlans.isEmpty ? 0.0 : completedToday / todayPlans.length;

    final motivation = WisdomService.generateForToday(plans);

    return RefreshIndicator(
      onRefresh: ref.read(plansProvider.notifier).refreshPlans,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 120),
        children: [
          Text(
            'Today Dashboard',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _ProgressHero(progress: progress, completed: completedToday, total: todayPlans.length),
          const SizedBox(height: 12),
          _MotivationCard(motivation: motivation),
          const SizedBox(height: 12),
          _HistoricalInspirationCard(motivation: motivation),
          const SizedBox(height: 12),
          ...todayPlans.map(
            (plan) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _PlanTile(plan: plan),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReflectionScreen extends StatelessWidget {
  const _ReflectionScreen({required this.plans});

  final List<Plan> plans;

  @override
  Widget build(BuildContext context) {
    final completed = plans.where((p) => p.status == PlanStatus.completed).toList();
    final postponed = plans.where((p) => p.status == PlanStatus.postponed).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 120),
      children: [
        Text(
          'Reflection Screen',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _ReflectionBucket(
          title: 'Bugün tamamlananlar',
          icon: Icons.check_circle_rounded,
          plans: completed,
        ),
        const SizedBox(height: 12),
        _ReflectionBucket(
          title: 'Ertelenenler',
          icon: Icons.update_rounded,
          plans: postponed,
        ),
      ],
    );
  }
}

class _MomentumView extends StatelessWidget {
  const _MomentumView({required this.plans});

  final List<Plan> plans;

  @override
  Widget build(BuildContext context) {
    final streak = _calculateStreak(plans);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 120),
      children: [
        Text(
          'Momentum View',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$streak gün üst üste ilerleme',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                const Text('Her gün en az 1 görevi tamamlayarak ritmini koruyorsun.'),
                const SizedBox(height: 14),
                LinearProgressIndicator(value: (streak % 7) / 7),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StuckDetection extends StatelessWidget {
  const _StuckDetection({required this.plans});

  final List<Plan> plans;

  @override
  Widget build(BuildContext context) {
    final stuckPlans = plans.where((p) => p.postponeCount >= 2).toList()
      ..sort((a, b) => b.postponeCount.compareTo(a.postponeCount));

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 120),
      children: [
        Text(
          'Stuck Detection',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        const Text('Sürekli ertelenen görevleri tespit edip kırılabilir adımlara dönüştür.'),
        const SizedBox(height: 12),
        if (stuckPlans.isEmpty)
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Şu an takılan görev yok. Momentum güçlü gidiyor. 🚀'),
            ),
          )
        else
          ...stuckPlans.map(
            (plan) => Card(
              child: ListTile(
                title: Text(plan.title),
                subtitle: Text('Ertelenme sayısı: ${plan.postponeCount}'),
                trailing: const Icon(Icons.priority_high_rounded),
              ),
            ),
          ),
      ],
    );
  }
}

class _ProgressHero extends StatelessWidget {
  const _ProgressHero({required this.progress, required this.completed, required this.total});

  final double progress;
  final int completed;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Bugünkü ilerleme', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 10),
            Text('$completed / $total görev tamamlandı'),
          ],
        ),
      ),
    );
  }
}

class _MotivationCard extends StatelessWidget {
  const _MotivationCard({required this.motivation});

  final MotivationOutput motivation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('"${motivation.quote}"', style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Text('- ${motivation.author}'),
            const Divider(height: 24),
            Text(motivation.whyThisQuote),
            const SizedBox(height: 8),
            Text('1 küçük aksiyon: ${motivation.microAction}'),
            const SizedBox(height: 6),
            Text('Bugün en küçük başlanabilir adım: ${motivation.smallestStartStep}'),
          ],
        ),
      ),
    );
  }
}

class _HistoricalInspirationCard extends StatelessWidget {
  const _HistoricalInspirationCard({required this.motivation});

  final MotivationOutput motivation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.auto_stories_rounded),
        title: Text(motivation.historicalPerson),
        subtitle: Text(motivation.historicalContext),
      ),
    );
  }
}

class _PlanTile extends ConsumerWidget {
  const _PlanTile({required this.plan});

  final Plan plan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(plan.title),
        subtitle: Text('${_formatTime(plan.scheduledTime)} · ${plan.category.name}'),
        trailing: Wrap(
          spacing: 4,
          children: [
            IconButton(
              tooltip: 'Tamamla',
              onPressed: plan.status == PlanStatus.completed
                  ? null
                  : () => ref.read(plansProvider.notifier).markPlanCompleted(plan.id),
              icon: const Icon(Icons.check_circle_rounded),
            ),
            IconButton(
              tooltip: 'Ertele',
              onPressed: () => ref.read(plansProvider.notifier).postponePlan(plan.id),
              icon: const Icon(Icons.schedule_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReflectionBucket extends StatelessWidget {
  const _ReflectionBucket({required this.title, required this.icon, required this.plans});

  final String title;
  final IconData icon;
  final List<Plan> plans;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 8),
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
              ],
            ),
            const SizedBox(height: 8),
            if (plans.isEmpty)
              const Text('Kayıt yok')
            else
              ...plans.map((plan) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text('• ${plan.title}'),
                  )),
          ],
        ),
      ),
    );
  }
}

bool _isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

String _formatTime(DateTime dateTime) {
  final hh = dateTime.hour.toString().padLeft(2, '0');
  final mm = dateTime.minute.toString().padLeft(2, '0');
  return '$hh:$mm';
}

int _calculateStreak(List<Plan> plans) {
  final completedDays = plans
      .where((plan) => plan.completedAt != null)
      .map((plan) => DateTime(plan.completedAt!.year, plan.completedAt!.month, plan.completedAt!.day))
      .toSet();

  var streak = 0;
  var cursor = DateTime.now();

  while (completedDays.contains(DateTime(cursor.year, cursor.month, cursor.day))) {
    streak += 1;
    cursor = cursor.subtract(const Duration(days: 1));
  }

  return streak;
}
