import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/video_of_the_day/domain/repositories/video_repository.dart';

/// Logs analytics events related to video interactions.
class LogVideoImpressionUseCase {
  const LogVideoImpressionUseCase(this._repository);

  final VideoRepository _repository;

  Future<Result<void>> call({
    required String userId,
    required String videoId,
    required String eventType, // e.g. 'impression', 'play', 'external_open'
  }) {
    return _repository.logImpression(
      userId: userId,
      videoId: videoId,
      eventType: eventType,
    );
  }
}
