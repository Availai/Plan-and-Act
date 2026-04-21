import 'dart:convert';
import 'package:planandact/core/errors/failure.dart';
import 'package:planandact/core/logging/logger.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/video_of_the_day/domain/entities/video_entity.dart';
import 'package:planandact/features/video_of_the_day/domain/repositories/video_repository.dart';
import 'package:planandact/shared/data/local/app_database.dart';
import 'package:planandact/shared/data/local/daos/video_dao.dart';

class DriftVideoRepository implements VideoRepository {
  const DriftVideoRepository(this._dao);

  final VideoDao _dao;
  static const _tag = 'DriftVideoRepository';

  @override
  Future<Result<VideoEntity?>> getCachedDailyVideo(DateTime targetDate) async {
    try {
      final row = await _dao.getCacheForDate(targetDate);
      if (row == null) return const Success(null);

      final json = jsonDecode(row.metadataJson) as Map<String, dynamic>;
      final entity = VideoEntity.fromJson(json);
      return Success(entity);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to parse cached daily video', e, st);
      return const Err(UnexpectedFailure('Cache parsing failed'));
    }
  }

  @override
  Future<Result<VideoEntity?>> getLastCachedSafeVideo() async {
    try {
      final row = await _dao.getLastCachedVideo();
      if (row == null) return const Success(null);

      final json = jsonDecode(row.metadataJson) as Map<String, dynamic>;
      final entity = VideoEntity.fromJson(json);
      return Success(entity);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to fetch last safe cached video', e, st);
      return const Err(UnexpectedFailure('Safe cache fetch failed'));
    }
  }

  @override
  Future<Result<void>> cacheDailyVideo(DateTime cacheDate, VideoEntity video) async {
    try {
      final jsonStr = jsonEncode(video.toJson());
      await _dao.cacheDailyVideo(cacheDate, video.id, jsonStr);
      return const Success(null);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to cache daily video', e, st);
      return const Err(UnexpectedFailure('Cache write failed'));
    }
  }

  @override
  Future<Result<void>> logImpression({
    required String userId,
    required String videoId,
    required String eventType,
  }) async {
    try {
      await _dao.logImpression(
        VideoImpressionsCompanion.insert(
          id: '${userId}_${videoId}_${DateTime.now().millisecondsSinceEpoch}',
          userId: userId,
          dailyVideoSelectionId: 'selection_ph', // In full db, links to a real daily selection id
          videoCandidateId: videoId,
          eventType: eventType,
          createdAt: DateTime.now(),
        ),
      );
      return const Success(null);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to log impression', e, st);
      return const Err(UnexpectedFailure('Impression logging failed'));
    }
  }
}
