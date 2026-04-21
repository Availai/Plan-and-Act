import 'package:flutter/material.dart';
import 'package:planandact/app/theme/app_colors.dart';
import 'package:planandact/app/theme/app_spacing.dart';
import 'package:planandact/features/video_of_the_day/domain/entities/video_entity.dart';

class VideoOfTheDayCard extends StatelessWidget {
  const VideoOfTheDayCard({
    super.key,
    required this.video,
    required this.onTap,
    this.isLoading = false,
  });

  final VideoEntity? video;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildSkeleton();
    }

    if (video == null) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.m, vertical: AppSpacing.s),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Thumbnail container with play button overlay
            Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    video!.thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade900,
                      child: const Center(
                        child: Icon(Icons.video_library_rounded, size: 48, color: Colors.white54),
                      ),
                    ),
                  ),
                ),
                // Play Button Glass effect center
                Container(
                  padding: const EdgeInsets.all(AppSpacing.s),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                // Top Right Badge
                Positioned(
                  top: AppSpacing.s,
                  right: AppSpacing.s,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.accentRed,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'GÜNÜN VİDEOSU',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.m),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    video!.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    video!.channelTitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMediumEmphasisLight,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeleton() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.m, vertical: AppSpacing.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.grey.withValues(alpha: 0.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 16, width: double.infinity, color: Colors.grey.withValues(alpha: 0.2)),
                const SizedBox(height: 8),
                Container(height: 12, width: 100, color: Colors.grey.withValues(alpha: 0.2)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
