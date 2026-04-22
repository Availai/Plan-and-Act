import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/features/planning/application/providers/use_case_providers.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_task_type.dart';
import 'package:planandact/features/planning/presentation/providers/plan_detail_providers.dart';
import 'package:planandact/shared/presentation/widgets/app_backdrop.dart';

class PlanDetailScreen extends ConsumerWidget {
  const PlanDetailScreen({
    super.key,
    required this.plan,
  });

  final PlanEntity plan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteAsync = ref.watch(planQuoteInsightProvider(plan));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan Detayi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded),
            onPressed: () {
              ref.read(deletePlanUseCaseProvider).call(plan.id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: AppBackdrop(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: AppSpacing.s),
              Wrap(
                spacing: AppSpacing.s,
                runSpacing: AppSpacing.s,
                children: [
                  _buildChip(context, plan.status.name.toUpperCase(), AppColors.statusColor(plan.status.name)),
                  _buildChip(context, plan.priority.name.toUpperCase(), AppColors.warning),
                  if (plan.durationMinutes != null)
                    _buildChip(context, '${plan.durationMinutes} dk', AppColors.panelOverlay),
                  if (plan.scheduledTimeLocal.isNotEmpty)
                    _buildChip(context, plan.scheduledTimeLocal, AppColors.accentCyan),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Aciklama',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.s),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.l),
                decoration: BoxDecoration(
                  color: AppColors.panelBackground.withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: Text(
                  plan.description.isNotEmpty
                      ? plan.description
                      : 'Aciklama veya not eklenmemis.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: AppSpacing.l),
              quoteAsync.when(
                loading: () => const _QuoteLoadingCard(),
                error: (_, __) => const SizedBox.shrink(),
                data: (insight) {
                  if (insight == null) return const SizedBox.shrink();
                  return _AnimatedQuoteCard(insight: insight);
                },
              ),
              const SizedBox(height: AppSpacing.xl),
              if (plan.status == PlanStatus.planned || plan.status == PlanStatus.postponed) ...[
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () async {
                      await ref.read(markPlanCompletedUseCaseProvider).call(plan.id);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.check_circle_rounded),
                    label: const Text('Hedefi Tamamla'),
                  ),
                ),
                const SizedBox(height: AppSpacing.m),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Geri Don'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: color),
      ),
    );
  }
}

class _AnimatedQuoteCard extends StatelessWidget {
  const _AnimatedQuoteCard({required this.insight});

  final PlanQuoteInsight insight;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 16),
            child: child,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.l),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.panelElevated.withValues(alpha: 0.95),
              AppColors.panelBackground.withValues(alpha: 0.92),
            ],
          ),
          border: Border.all(
            color: AppColors.accentPurple.withValues(alpha: 0.45),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.accentPurple.withValues(alpha: 0.18),
              blurRadius: 26,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.auto_awesome_rounded,
                  color: AppColors.accentPurple,
                ),
                const SizedBox(width: AppSpacing.s),
                Text(
                  'Onemli Soz • ${insight.taskType.label}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.accentPurple,
                      ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.m),
            Text(
              '"${insight.quoteText}"',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.m),
            Text(
              '— ${insight.figureName}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.accentCyan,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuoteLoadingCard extends StatelessWidget {
  const _QuoteLoadingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.l),
      decoration: BoxDecoration(
        color: AppColors.panelBackground.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: const Row(
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: AppSpacing.s),
          Text('Uygun soz seciliyor...'),
        ],
      ),
    );
  }
}
