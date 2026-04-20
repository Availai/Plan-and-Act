import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planandact/core/storage_service.dart';
import 'package:planandact/features/plan_management/add_plan_sheet.dart';
import 'package:planandact/features/plan_management/home_screen.dart';
import 'package:planandact/features/plan_management/plan_model.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'plan/new',
          pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const _NewPlanRoutePage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                final curve = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(curve),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: 'plan/:id',
          builder: (context, state) {
            return PlanDetailPage(
              planId: state.pathParameters['id'] ?? '',
              initialPlan: state.extra is PlanModel ? state.extra as PlanModel : null,
            );
          },
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsPage(),
        ),
      ],
    ),
  ],
);

class _NewPlanRoutePage extends StatelessWidget {
  const _NewPlanRoutePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x70000000),
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: const AddPlanSheet(),
          ),
        ),
      ),
    );
  }
}

class PlanDetailPage extends StatefulWidget {
  const PlanDetailPage({super.key, required this.planId, this.initialPlan});

  final String planId;
  final PlanModel? initialPlan;

  @override
  State<PlanDetailPage> createState() => _PlanDetailPageState();
}

class _PlanDetailPageState extends State<PlanDetailPage> {
  PlanModel? _plan;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPlan();
  }

  Future<void> _loadPlan() async {
    if (widget.initialPlan != null) {
      setState(() {
        _plan = widget.initialPlan;
        _isLoading = false;
      });
      return;
    }

    final plans = await StorageService.loadPlans();
    PlanModel? maybePlan;
    for (final plan in plans) {
      if (plan.id == widget.planId) {
        maybePlan = plan;
        break;
      }
    }

    setState(() {
      _plan = maybePlan;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final plan = _plan;

    return Scaffold(
      appBar: AppBar(title: const Text('Plan Detayı')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : plan == null
              ? const Center(child: Text('Plan bulunamadı.'))
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            plan.title,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${plan.scheduledTime.day.toString().padLeft(2, '0')}/'
                            '${plan.scheduledTime.month.toString().padLeft(2, '0')}/'
                            '${plan.scheduledTime.year} '
                            '${plan.scheduledTime.hour.toString().padLeft(2, '0')}:'
                            '${plan.scheduledTime.minute.toString().padLeft(2, '0')}',
                          ),
                          if (plan.description.trim().isNotEmpty) ...[
                            const SizedBox(height: 14),
                            Text(plan.description),
                          ],
                          if ((plan.assignedWisdom ?? '').trim().isNotEmpty) ...[
                            const SizedBox(height: 18),
                            Text(
                              'Motivasyon',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(plan.assignedWisdom!),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.palette_outlined),
            title: Text('Tema'),
            subtitle: Text('Açık / koyu tema seçenekleri'),
          ),
          ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text('Dil'),
            subtitle: Text('Uygulama dil tercihi'),
          ),
          ListTile(
            leading: Icon(Icons.notifications_active_outlined),
            title: Text('Bildirimler'),
            subtitle: Text('Hatırlatma ve motivasyon bildirimleri'),
          ),
        ],
      ),
    );
  }
}
