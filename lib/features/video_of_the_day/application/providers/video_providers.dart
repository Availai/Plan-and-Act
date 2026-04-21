import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/planning/application/providers/database_provider.dart';
import 'package:planandact/features/video_of_the_day/application/use_cases/fetch_daily_video_use_case.dart';
import 'package:planandact/features/video_of_the_day/application/use_cases/log_video_impression_use_case.dart';
import 'package:planandact/features/video_of_the_day/data/repositories/drift_video_repository.dart';
import 'package:planandact/features/video_of_the_day/data/sources/remote_video_data_source.dart';
import 'package:planandact/features/video_of_the_day/domain/repositories/video_repository.dart';
import 'package:planandact/shared/data/local/daos/video_dao.dart';

/// Provides the VideoDao.
final videoDaoProvider = Provider<VideoDao>((ref) {
  final db = ref.watch(databaseProvider);
  return VideoDao(db);
});

/// Provides the abstract VideoRepository.
final videoRepositoryProvider = Provider<VideoRepository>((ref) {
  final dao = ref.watch(videoDaoProvider);
  return DriftVideoRepository(dao);
});

/// Provides the Mock remote data source.
final remoteVideoDataSourceProvider = Provider<RemoteVideoDataSource>((ref) {
  return MockRemoteVideoDataSource();
});

/// Provides the FetchDailyVideoUseCase.
final fetchDailyVideoUseCaseProvider = Provider<FetchDailyVideoUseCase>((ref) {
  final repo = ref.watch(videoRepositoryProvider);
  final remote = ref.watch(remoteVideoDataSourceProvider);
  return FetchDailyVideoUseCase(repo, remote);
});

/// Provides the LogVideoImpressionUseCase.
final logVideoImpressionUseCaseProvider = Provider<LogVideoImpressionUseCase>((ref) {
  final repo = ref.watch(videoRepositoryProvider);
  return LogVideoImpressionUseCase(repo);
});
