import 'package:planandact/features/plan_management/domain/plan_repository.dart';
import 'package:planandact/features/plan_management/plan_model.dart';

/// Backward-compatible facade.
/// New code should depend on [PlanRepository] directly.
class StorageService {
  StorageService(this._repository);

  final PlanRepository _repository;

  Future<void> savePlans(List<PlanModel> plans) => _repository.savePlans(plans);

  Future<List<PlanModel>> loadPlans() => _repository.fetchPlans();
}
