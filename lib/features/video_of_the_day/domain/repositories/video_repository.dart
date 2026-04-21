import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/video_of_the_day/domain/entities/video_entity.dart';

/// Repository interface for fetching and caching the Video of the Day.
abstract class VideoRepository {
  /// Fetches the daily video from local cache. 
  /// Returns null if there is no cache for the given date.
  Future<Result<VideoEntity?>> getCachedDailyVideo(DateTime targetDate);
  
  /// Fetches the last cached video safely, regardless of the date.
  /// Used as a fallback if the remote fetch fails.
  Future<Result<VideoEntity?>> getLastCachedSafeVideo();

  /// Caches the video entity for the specified date.
  Future<Result<void>> cacheDailyVideo(DateTime cacheDate, VideoEntity video);

  /// Logs a user interaction with the daily video.
  Future<Result<void>> logImpression({
    required String userId,
    required String videoId,
    required String eventType, // 'impression', 'click'
  });
}
