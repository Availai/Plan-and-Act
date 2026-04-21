import 'package:planandact/core/logging/logger.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/video_of_the_day/data/sources/remote_video_data_source.dart';
import 'package:planandact/features/video_of_the_day/domain/entities/video_entity.dart';
import 'package:planandact/features/video_of_the_day/domain/repositories/video_repository.dart';

/// Orchestrates the fetch, cache, and fallback strategy for the daily video.
class FetchDailyVideoUseCase {
  const FetchDailyVideoUseCase(this._repo, this._remoteSource);

  final VideoRepository _repo;
  final RemoteVideoDataSource _remoteSource;
  static const _tag = 'FetchDailyVideoUseCase';

  Future<VideoEntity?> call(DateTime date) async {
    // 1. Check local cache for the specified date
    final cacheResult = await _repo.getCachedDailyVideo(date);
    if (cacheResult is Success<VideoEntity?> && cacheResult.value != null) {
      AppLogger.info(_tag, 'Returned video from local cache for $date');
      return cacheResult.value;
    }

    // 2. Not in cache for today, fetch from remote
    try {
      final remoteVideo = await _remoteSource.fetchDailyVideo(date);
      
      // Cache it
      await _repo.cacheDailyVideo(date, remoteVideo);
      AppLogger.info(_tag, 'Fetched and cached new daily video for $date');
      
      return remoteVideo;
    } catch (e, st) {
      AppLogger.error(_tag, 'Remote fetch failed, attempting safe fallback', e, st);
      
      // 3. Fallback to the last successfully cached video
      final fallbackResult = await _repo.getLastCachedSafeVideo();
      if (fallbackResult is Success<VideoEntity?> && fallbackResult.value != null) {
        AppLogger.warning(_tag, 'Returning fallback video: ${fallbackResult.value!.title}');
        return fallbackResult.value;
      }

      // Everything failed
      return null;
    }
  }
}
