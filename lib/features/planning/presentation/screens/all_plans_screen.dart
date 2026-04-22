import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/features/planning/application/providers/use_case_providers.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/presentation/providers/all_plans_providers.dart';
import 'package:planandact/features/planning/presentation/widgets/add_plan_sheet.dart';
import 'package:planandact/features/planning/presentation/widgets/plan_list_tile.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';
import 'package:planandact/shared/presentation/widgets/empty_state_view.dart';

class AllPlansScreen extends ConsumerWidget {
  const AllPlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plansAsync = ref.watch(allPlansProvider);
    final groupFormatter = DateFormat('d MMMM y', 'tr');

    return Scaffold(
      appBar: AppBar(title: const Text('Tum Planlar')),
      body: AppBackdrop(
        child: plansAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Padding(
            padding: const EdgeInsets.all(AppSpacing.l),
            child: Text('Hata: $error'),
          ),
          data: (plans) {
            if (plans.isEmpty) {
              return const EmptyStateView(
                title: 'Hic plan yok',
                message: 'Listeyi doldurmak icin ilk planini olustur.',
                icon: Icons.event_note_rounded,
              );
            }

            final grouped = <DateTime, List<PlanEntity>>{};
            for (final plan in plans) {
              final key = DateTime(
                plan.scheduledDate.year,
                plan.scheduledDate.month,
                plan.scheduledDate.day,
              );
              grouped.putIfAbsent(key, () => []).add(plan);
            }

            final orderedKeys = grouped.keys.toList()
              ..sort((a, b) => b.compareTo(a));

            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(allPlansProvider);
                await ref.read(allPlansProvider.future);
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.m),
                itemCount: orderedKeys.length,
                itemBuilder: (context, index) {
                  final date = orderedKeys[index];
                  final dayPlans = grouped[date]!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.s,
                        ),
                        child: Text(
                          '${groupFormatter.format(date)}  •  ${dayPlans.length}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      ...dayPlans.map(
                        (plan) => PlanListTile(
                          plan: plan,
                          onToggleComplete: (value) {
                            if (value) {
                              ref
                                  .read(markPlanCompletedUseCaseProvider)
                                  .call(plan.id);
                            }
                          },
                          onDelete: () {
                            ref.read(deletePlanUseCaseProvider).call(plan.id);
                          },
                          onEdit: () {
                            AddPlanSheet.show(
                              context,
                              selectedDate: plan.scheduledDate,
                              initialPlan: plan,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: AppSpacing.m),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
