import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/features/planning/application/providers/planning_providers.dart';
import 'package:planandact/features/planning/application/providers/use_case_providers.dart';
import 'package:planandact/features/planning/presentation/providers/today_dashboard_providers.dart';
import 'package:planandact/features/planning/presentation/widgets/add_plan_sheet.dart';
import 'package:planandact/features/planning/presentation/widgets/plan_list_tile.dart';
import 'package:planandact/shared/presentation/widgets/empty_state_view.dart';
import 'package:planandact/shared/presentation/widgets/video_of_the_day_card.dart';
import 'package:planandact/shared/presentation/widgets/wisdom_card.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoAsync = ref.watch(currentDailyVideoProvider);
    final wisdomAsync = ref.watch(currentWisdomDecisionProvider);
    final plansAsync = ref.watch(todayPlansProvider);
    
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Header Data
    final now = DateTime.now();
    final formatter = DateFormat('d MMMM', 'tr');
    final formattedDate = formatter.format(now);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Floating Header & Progress
            SliverAppBar(
              floating: true,
              backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
              elevation: 0,
              expandedHeight: 80,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.symmetric(horizontal: AppSpacing.m, vertical: 12),
                title: Text(
                  'Bugün, $formattedDate',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            
            // Progress Indicator (2px Thin)
            SliverToBoxAdapter(
              child: plansAsync.whenOrNull(
                data: (plans) {
                  if (plans.isEmpty) return const SizedBox.shrink();
                  final completedCount = plans.where((p) => p.status.name == 'completed').length;
                  final totalCount = plans.length;
                  final progress = totalCount > 0 ? completedCount / totalCount : 0.0;
                  
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m, vertical: AppSpacing.s),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 2,
                        backgroundColor: isDark ? AppColors.borderDark : AppColors.borderLight,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accentGreen),
                      ),
                    ),
                  );
                }
              ) ?? const SizedBox.shrink(),
            ),

            // Horizontal Glass Calendar Strip
            SliverToBoxAdapter(
              child: Container(
                height: 70,
                margin: const EdgeInsets.symmetric(vertical: AppSpacing.s),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
                  itemCount: 14,
                  itemBuilder: (context, index) {
                    final date = now.subtract(Duration(days: 3)).add(Duration(days: index));
                    final isToday = date.day == now.day && date.month == now.month;
                    final dayStr = DateFormat('E', 'tr').format(date).toUpperCase();
                    
                    return Container(
                      width: 50,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: isToday 
                            ? AppColors.primary 
                            : (isDark ? AppColors.surfaceDark : AppColors.surfaceLight),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isToday ? AppColors.primary : (isDark ? AppColors.borderDark : AppColors.borderLight),
                        ),
                        boxShadow: isToday ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 4)
                          )
                        ] : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dayStr,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: isToday 
                                  ? Colors.white 
                                  : (isDark ? AppColors.textMediumEmphasisDark : AppColors.textMediumEmphasisLight),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${date.day}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: isToday 
                                  ? Colors.white 
                                  : (isDark ? AppColors.textHighEmphasisDark : AppColors.textHighEmphasisLight),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // Main Insights Cards
            SliverToBoxAdapter(
              child: VideoOfTheDayCard(
                video: videoAsync.valueOrNull,
                isLoading: videoAsync.isLoading,
                onTap: () {},
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

            // Plan List with smooth sorting implicitly via Stream
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
              sliver: plansAsync.when(
                loading: () => const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (e, st) => SliverToBoxAdapter(
                  child: Center(child: Text('Hata: $e')),
                ),
                data: (plans) {
                  if (plans.isEmpty) {
                    return SliverToBoxAdapter(
                      child: EmptyStateView(
                        title: 'Harika bir gün!',
                        message: 'Bugün için planlamanızı yapın ve akışa katılın.',
                      ),
                    );
                  }

                  // Render list 
                  return SliverAnimatedList(
                    initialItemCount: plans.length,
                    itemBuilder: (context, index, animation) {
                      if (index >= plans.length) return const SizedBox.shrink();
                      final plan = plans[index];
                      return SizeTransition(
                        sizeFactor: animation,
                        child: PlanListTile(
                          plan: plan,
                          onToggleComplete: (val) {
                            if (val) {
                              ref.read(completePlanProvider(plan.id));
                              ref.read(markPlanCompletedUseCaseProvider).call(plan.id);
                            }
                          },
                          onDelete: () {
                            ref.read(deletePlanUseCaseProvider).call(plan.id);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
          ],
        ),
      ),
      // Integrate floating Add Bar instead of standard FAB
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () => AddPlanSheet.show(context),
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2C2C2E) : Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                spreadRadius: 5,
                offset: const Offset(0, 5),
              )
            ],
            border: Border.all(
              color: isDark ? Colors.white10 : AppColors.borderLight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: isDark ? Colors.white : Colors.black,
              ),
              const SizedBox(width: AppSpacing.s),
              Text(
                'Görev Ekle',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
