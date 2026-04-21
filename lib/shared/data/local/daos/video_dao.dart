import 'package:drift/drift.dart';
import 'package:planandact/shared/data/local/app_database.dart';
import 'package:planandact/shared/data/local/tables/video_tables.dart';

part 'video_dao.g.dart';

@DriftAccessor(tables: [
  DailyVideoCache,
  VideoCandidates,
  VideoTopics,
  VideoCandidateTopics,
  DailyVideoSelections,
  VideoImpressions,
])
class VideoDao extends DatabaseAccessor<AppDatabase> with _$VideoDaoMixin {
  VideoDao(super.db);

  /// Gets the cached video for a specific UTC date.
  Future<DailyVideoCacheData?> getCacheForDate(DateTime date) {
    // Normalizing the date to start of day (midnight) to allow matching
    final startOfDay = DateTime.utc(date.year, date.month, date.day);
    return (select(dailyVideoCache)
          ..where((c) => c.cacheDate.equals(startOfDay)))
        .getSingleOrNull();
  }

  /// Gets the most recent successfully cached video as a fallback.
  Future<DailyVideoCacheData?> getLastCachedVideo() {
    return (select(dailyVideoCache)
          ..orderBy([(c) => OrderingTerm.desc(c.cachedAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  /// Saves a daily video metadata string to cache.
  Future<void> cacheDailyVideo(
    DateTime cacheDate,
    String videoCandidateId,
    String metadataJson,
  ) async {
    final startOfDay = DateTime.utc(cacheDate.year, cacheDate.month, cacheDate.day);
    
    await into(dailyVideoCache).insert(
      DailyVideoCacheCompanion.insert(
        id: '${startOfDay.millisecondsSinceEpoch}_$videoCandidateId',
        cacheDate: startOfDay,
        videoCandidateId: videoCandidateId,
        metadataJson: metadataJson,
        cachedAt: DateTime.now(),
      ),
      mode: InsertMode.replace, // Upsert if exists for same date/id combo depending on pk
    );
  }

  /// Logs a user interaction.
  Future<void> logImpression(VideoImpressionsCompanion entry) {
    return into(videoImpressions).insert(entry);
  }
}
