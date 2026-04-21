import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({
    super.key,
    required this.title,
    required this.message,
    this.icon,
  });

  final String title;
  final String message;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Safe fallback Lottie URL for minimalist loading/empty
            SizedBox(
              height: 150,
              child: Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_tlla1zxu.json', // Calm minimalist animation
                errorBuilder: (context, error, stackTrace) => Icon(
                  icon ?? Icons.done_all_rounded,
                  size: 64,
                  color: (isDark ? AppColors.textMediumEmphasisDark : AppColors.textMediumEmphasisLight).withValues(alpha: 0.3),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.l),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: AppSpacing.s),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
