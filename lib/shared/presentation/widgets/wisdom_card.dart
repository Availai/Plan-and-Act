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
            // Decorative quote icon
            const Icon(
              Icons.format_quote_rounded,
              color: AppColors.accentAmber,
              size: 32,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              decision!.selectedQuoteText ?? 'Odaklan ve Harekete Geç.',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: AppSpacing.m),
            Row(
              children: [
                Container(
                  width: 24,
                  height: 2,
                  color: AppColors.accentBlue,
                ),
                const SizedBox(width: AppSpacing.s),
                Text(
                  decision!.historicalFigureName ?? 'Sistem',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                ),
              ],
            ),
            if (decision!.selectedCategories.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.m),
              Wrap(
                spacing: AppSpacing.xs,
                children: decision!.selectedCategories.take(2).map((cat) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundLight,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Text(
                      cat.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMediumEmphasisLight,
                      ),
                    ),
                  );
                }).toList(),
              )
            ]
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
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: AppSpacing.m),
            Container(
              width: double.infinity,
              height: 16,
              color: Colors.grey.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 8),
            Container(
              width: 200,
              height: 16,
              color: Colors.grey.withValues(alpha: 0.2),
            ),
            const SizedBox(height: AppSpacing.m),
            Container(
              width: 100,
              height: 12,
              color: Colors.grey.withValues(alpha: 0.2),
            ),
          ],
        ),
      ),
    );
  }
}
