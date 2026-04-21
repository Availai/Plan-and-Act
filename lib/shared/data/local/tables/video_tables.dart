import 'package:drift/drift.dart';

/// YouTube video metadata candidates.
class VideoCandidates extends Table {
  TextColumn get id => text()();
  TextColumn get youtubeVideoId => text()();
  TextColumn get title => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get thumbnailUrl => text()();
  TextColumn get channelTitle => text()();
  DateTimeColumn get publishedAt => dateTime()();
  TextColumn get canonicalUrl => text()();
  TextColumn get languageCode => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get fetchedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Topic tags for videos (e.g. focus, discipline, resilience).
class VideoTopics extends Table {
  TextColumn get id => text()();
  TextColumn get slug => text().unique()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Join table between video_candidates and video_topics.
class VideoCandidateTopics extends Table {
  TextColumn get videoCandidateId => text()();
  TextColumn get topicId => text()();

  @override
  Set<Column> get primaryKey => {videoCandidateId, topicId};
}

/// Daily video selection record.
class DailyVideoSelections extends Table {
  TextColumn get id => text()();
  DateTimeColumn get selectionDate => dateTime()();
  TextColumn get topicId => text()();
  TextColumn get videoCandidateId => text()();
  TextColumn get selectionReason => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// User impression/click analytics for daily video.
class VideoImpressions extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get dailyVideoSelectionId => text()();
  TextColumn get videoCandidateId => text()();
  TextColumn get eventType => text()(); // impression, click, open
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Local-only cache for current day's video.
class DailyVideoCache extends Table {
  TextColumn get id => text()();
  DateTimeColumn get cacheDate => dateTime()();
  TextColumn get videoCandidateId => text()();
  TextColumn get metadataJson => text()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
