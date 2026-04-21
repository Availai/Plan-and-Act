import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:planandact/app/router/route_names.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/application/providers/use_case_providers.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_lane.dart';
import 'package:planandact/features/planning/presentation/providers/today_dashboard_providers.dart';
import 'package:planandact/features/planning/presentation/widgets/add_plan_sheet.dart';
import 'package:planandact/features/planning/presentation/widgets/next_action_card.dart';
import 'package:planandact/features/planning/presentation/widgets/plan_list_tile.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';
import 'package:planandact/shared/presentation/widgets/empty_state_view.dart';
import 'package:planandact/shared/presentation/widgets/wisdom_card.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextPlan = ref.watch(nextActionablePlanProvider);
    final wisdomAsync = ref.watch(currentWisdomDecisionProvider);
    final plansAsync = ref.watch(selectedDatePlansProvider);
    final selectedDate = ref.watch(selectedDashboardDateProvider);

    final formatter = DateFormat('d MMMM', 'tr');
    final formattedDate = formatter.format(selectedDate);

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => AddPlanSheet.show(
          context,
          selectedDate: selectedDate,
        ),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Plan Ekle'),
      ),
      body: AppBackdrop(
        child: SafeArea(
          bottom: false,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.m,
                    AppSpacing.m,
                    AppSpacing.m,
                    AppSpacing.s,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today::$formattedDate',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: AppColors.textPrimary),
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              'Planla. Uygula. Tekrarlanabilir kal.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      IconButton.filledTonal(
                        onPressed: () => context.push(RouteNames.settings),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.panelElevated.withValues(alpha: 0.84),
                        ),
                        icon: const Icon(Icons.tune_rounded),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: plansAsync.whenOrNull(
                      data: (plans) {
                        final progress = _completionProgress(plans);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gunun Ilerlemesi',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: AppSpacing.s),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(999),
                                child: LinearProgressIndicator(
                                  value: progress,
                                  minHeight: 8,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ) ??
                    const SizedBox.shrink(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 78,
                  margin: const EdgeInsets.only(top: AppSpacing.m),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      final anchor = DateTime.now().subtract(const Duration(days: 3));
                      final date = anchor.add(Duration(days: index));
                      final normalized = DateTime(date.year, date.month, date.day);
                      final isSelected = normalized == selectedDate;
                      final dayStr = DateFormat('E', 'tr').format(date).toUpperCase();

                      return InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: () {
                          ref.read(selectedDashboardDateProvider.notifier).state = normalized;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          width: 58,
                          margin: const EdgeInsets.only(right: AppSpacing.s),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.accentPurple.withValues(alpha: 0.22)
                                : AppColors.panelBackground.withValues(alpha: 0.86),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.accentPurple
                                  : AppColors.borderSubtle,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: AppColors.accentPurple.withValues(alpha: 0.24),
                                      blurRadius: 18,
                                      spreadRadius: 1,
                                    ),
                                  ]
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dayStr,
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                      color: isSelected
                                          ? AppColors.textPrimary
                                          : AppColors.textMuted,
                                    ),
                              ),
                              const SizedBox(height: AppSpacing.xxs),
                              Text(
                                '${date.day}',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: NextActionCard(
                  plan: nextPlan,
                  onOpen: () {
                    if (nextPlan == null) return;
                    context.push(RouteNames.planDetailPath(nextPlan.id));
                  },
                  onComplete: () async {
                    if (nextPlan == null) return;
                    final result = await ref
                        .read(markPlanCompletedUseCaseProvider)
                        .call(nextPlan.id);
                    if (!context.mounted) return;
                    switch (result) {
                      case Err(:final failure):
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(failure.message)),
                        );
                      case Success():
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Plan tamamlandi.')),
                        );
                    }
                  },
                  onCreatePlan: () => AddPlanSheet.show(
                    context,
                    selectedDate: selectedDate,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: WisdomCard(
                  decision: wisdomAsync.valueOrNull,
                  isLoading: wisdomAsync.isLoading,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: AppSpacing.m),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
                sliver: plansAsync.when(
                  loading: () => const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (error, stackTrace) => SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.l),
                      child: Text('Hata: $error'),
                    ),
                  ),
                  data: (plans) {
                    if (plans.isEmpty) {
                      return const SliverToBoxAdapter(
                        child: EmptyStateView(
                          title: 'Plan panosu bos',
                          message: 'Bugun icin ilk hedefini ekleyip akisi baslat.',
                          icon: Icons.rocket_launch_rounded,
                        ),
                      );
                    }

                    final grouped = <PlanLane, List<PlanEntity>>{
                      for (final lane in PlanLane.values) lane: [],
                    };
                    for (final plan in plans) {
                      grouped[PlanLane.fromCategoryId(plan.categoryId)]!.add(plan);
                    }

                    final children = <Widget>[];
                    for (final lane in PlanLane.values) {
                      final lanePlans = grouped[lane]!;
                      children.add(
                        Padding(
                          padding: const EdgeInsets.only(
                            top: AppSpacing.m,
                            bottom: AppSpacing.s,
                          ),
                          child: Text(
                            lane.labelTr,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.laneColor(lane.id),
                                ),
                          ),
                        ),
                      );
                      if (lanePlans.isEmpty) {
                        children.add(
                          Padding(
                            padding: const EdgeInsets.only(bottom: AppSpacing.s),
                            child: Text(
                              'Bu lane icin acik plan yok.',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        );
                        continue;
                      }

                      for (final plan in lanePlans) {
                        children.add(
                          PlanListTile(
                            plan: plan,
                            onToggleComplete: (value) {
                              if (value) {
                                ref.read(markPlanCompletedUseCaseProvider).call(plan.id);
                              }
                            },
                            onDelete: () {
                              ref.read(deletePlanUseCaseProvider).call(plan.id);
                            },
                            onEdit: () {
                              AddPlanSheet.show(
                                context,
                                selectedDate: selectedDate,
                                initialPlan: plan,
                              );
                            },
                          ),
                        );
                      }
                    }

                    return SliverList(
                      delegate: SliverChildListDelegate(children),
                    );
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 120),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _completionProgress(List<PlanEntity> plans) {
    if (plans.isEmpty) return 0;
    final completedCount =
        plans.where((plan) => plan.status.name == 'completed').length;
    return completedCount / plans.length;
  }
}
