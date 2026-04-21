import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/repositories/plan_repository.dart';

/// Returns today's plans for a user.
class GetTodayPlansUseCase {
  const GetTodayPlansUseCase(this._repository);

  final PlanRepository _repository;

  Future<Result<List<PlanEntity>>> call(String userId) {
    return _repository.getPlansForDate(userId, DateTime.now());
  }

  /// Reactive stream variant.
  Stream<List<PlanEntity>> watch(String userId) {
    return _repository.watchPlansForDate(userId, DateTime.now());
  }
}
