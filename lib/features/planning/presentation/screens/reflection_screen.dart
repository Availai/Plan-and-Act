import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/features/planning/application/providers/use_case_providers.dart';
import 'package:planandact/features/planning/presentation/providers/reflection_providers.dart';
import 'package:planandact/features/planning/presentation/widgets/plan_list_tile.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';
import 'package:planandact/shared/presentation/widgets/empty_state_view.dart';

class ReflectionScreen extends ConsumerWidget {
  const ReflectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedAsync = ref.watch(completedPlansProvider);
    final missedAsync = ref.watch(missedPlansProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Yansima')),
      body: AppBackdrop(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Tamamlananlar',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.s),
              completedAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Text('Hata: $error'),
                data: (plans) {
                  if (plans.isEmpty) {
                    return const EmptyStateView(
                      title: 'Tamamlanan plan yok',
                      message: 'Bitirdigin hedefler burada toplanacak.',
                      icon: Icons.history_toggle_off_rounded,
                    );
                  }
                  return Column(
                    children: plans
                        .map(
                          (plan) => PlanListTile(
                            plan: plan,
                            onToggleComplete: (_) {},
                            onDelete: () {
                              ref.read(deletePlanUseCaseProvider).call(plan.id);
                            },
                            onEdit: () {},
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Kacirilan / Ertelenenler',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.s),
              missedAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Text('Hata: $error'),
                data: (plans) {
                  if (plans.isEmpty) {
                    return const EmptyStateView(
                      title: 'Temiz gorunuyor',
                      message: 'Su an ertelenen veya kacirilan bir plan yok.',
                      icon: Icons.task_alt_rounded,
                    );
                  }
                  return Column(
                    children: plans
                        .map(
                          (plan) => PlanListTile(
                            plan: plan,
                            onToggleComplete: (_) {},
                            onDelete: () {
                              ref.read(deletePlanUseCaseProvider).call(plan.id);
                            },
                            onEdit: () {},
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
