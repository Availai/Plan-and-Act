import 'package:flutter/material.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/features/wisdom_engine/domain/entities/wisdom_decision.dart';

class WisdomCard extends StatelessWidget {
  const WisdomCard({
    super.key,
    required this.decision,
    this.isLoading = false,
  });

  final WisdomDecision? decision;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildSkeleton(context);
    }

    if (decision == null) {
      return const SizedBox.shrink();
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.m, vertical: AppSpacing.s),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.accentPink.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.format_quote_rounded,
                color: AppColors.accentPink,
              ),
            ),
            const SizedBox(height: AppSpacing.m),
            Text(
              decision!.selectedQuoteText ?? 'Odaklan ve harekete gec.',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: AppSpacing.m),
            Row(
              children: [
                Container(
                  width: 28,
                  height: 2,
                  color: AppColors.accentCyan,
                ),
                const SizedBox(width: AppSpacing.s),
                Text(
                  decision!.historicalFigureName ?? 'Sistem',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ],
            ),
            if (decision!.selectedCategories.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.m),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: decision!.selectedCategories.take(3).map((category) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.panelElevated.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Text(
                      category.toUpperCase(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSkeleton(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.m, vertical: AppSpacing.s),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SkeletonLine(width: 40, height: 40, radius: 14),
            const SizedBox(height: AppSpacing.m),
            const _SkeletonLine(width: double.infinity, height: 18),
            const SizedBox(height: AppSpacing.s),
            const _SkeletonLine(width: 220, height: 18),
            const SizedBox(height: AppSpacing.m),
            const _SkeletonLine(width: 120, height: 12),
          ],
        ),
      ),
    );
  }
}

class _SkeletonLine extends StatelessWidget {
  const _SkeletonLine({
    required this.width,
    required this.height,
    this.radius = 8,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.shimmerBase,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
