import 'package:flutter_test/flutter_test.dart';
import 'package:planandact/core/errors/failure.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/video_of_the_day/application/services/daily_video_theme_resolver.dart';
import 'package:planandact/features/video_of_the_day/application/use_cases/fetch_daily_video_use_case.dart';
import 'package:planandact/features/video_of_the_day/data/sources/remote_video_data_source.dart';
import 'package:planandact/features/video_of_the_day/domain/entities/video_entity.dart';
import 'package:planandact/features/video_of_the_day/domain/repositories/video_repository.dart';

class MockFailingRemoteSource implements RemoteVideoDataSource {
  @override
  Future<VideoEntity> fetchDailyVideo(DateTime targetDate, {required String theme}) async {
    throw Exception('API Quota Exceeded');
  }
}

class MockWorkingRemoteSource implements RemoteVideoDataSource {
  @override
  Future<VideoEntity> fetchDailyVideo(DateTime targetDate, {required String theme}) async {
    return VideoEntity(
      id: 'remote_1',
      youtubeVideoId: '123',
      title: '$theme Remote Video',
      description: 'Desc',
      thumbnailUrl: 'url',
      channelTitle: 'channel',
      publishedAt: DateTime.now(),
      canonicalUrl: 'canon',
      topics: [],
    );
  }
}

class MockVideoRepository implements VideoRepository {
  bool failCacheRead = false;
  VideoEntity? fallbackVideo;
  VideoEntity? todayVideo;

  @override
  Future<Result<void>> cacheDailyVideo(DateTime cacheDate, VideoEntity video) async {
    return const Success(null);
  }

  @override
  Future<Result<VideoEntity?>> getCachedDailyVideo(DateTime targetDate) async {
    if (failCacheRead) return const Err(UnexpectedFailure('Cache read failed'));
    return Success(todayVideo);
  }

  @override
  Future<Result<VideoEntity?>> getLastCachedSafeVideo() async {
    return Success(fallbackVideo);
  }

  @override
  Future<Result<void>> logImpression(
      {required String userId, required String videoId, required String eventType}) async {
    return const Success(null);
  }
}

void main() {
  final referenceMonday = DateTime.utc(2026, 4, 20);

  group('FetchDailyVideoUseCase', () {
    test('Returns cached video if found for today', () async {
      final repo = MockVideoRepository();
      repo.todayVideo = VideoEntity(
        id: 'local_1',
        youtubeVideoId: '123',
        title: 'Local Cached Video',
        description: 'Desc',
        thumbnailUrl: 'url',
        channelTitle: 'channel',
        publishedAt: DateTime.now(),
        canonicalUrl: 'canon',
        topics: [],
      );
      final remote = MockFailingRemoteSource();
      final useCase = FetchDailyVideoUseCase(
        repo,
        remote,
        const DailyVideoThemeResolver(),
      );

      final result = await useCase.call(referenceMonday);
      
      expect(result?.id, 'local_1');
      expect(result?.title, 'Local Cached Video');
    });

    test('Fetches from remote and caches if local cache is empty', () async {
      final repo = MockVideoRepository();
      // local cache is empty
      repo.todayVideo = null;
      final remote = MockWorkingRemoteSource();
      final useCase = FetchDailyVideoUseCase(
        repo,
        remote,
        const DailyVideoThemeResolver(),
      );

      final result = await useCase.call(referenceMonday);
      
      expect(result?.id, 'remote_1');
      expect(result?.title, 'focus Remote Video');
    });

    test('Falls back to last safe cached video if remote fails', () async {
      final repo = MockVideoRepository();
      // local cache is empty for today
      repo.todayVideo = null;
      
      // previous days cache exists
      repo.fallbackVideo = VideoEntity(
        id: 'fallback_1',
        youtubeVideoId: '456',
        title: 'Safe Fallback Video',
        description: 'Desc',
        thumbnailUrl: 'url',
        channelTitle: 'channel',
        publishedAt: DateTime.now(),
        canonicalUrl: 'canon',
        topics: [],
      );

      final remote = MockFailingRemoteSource(); // simulate API down
      final useCase = FetchDailyVideoUseCase(
        repo,
        remote,
        const DailyVideoThemeResolver(),
      );

      final result = await useCase.call(referenceMonday);
      
      expect(result?.id, 'fallback_1');
      expect(result?.title, 'Safe Fallback Video');
    });
  });
}
