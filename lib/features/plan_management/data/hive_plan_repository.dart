import 'package:planandact/features/plan_management/data/hive_plan_storage.dart';
import 'package:planandact/features/plan_management/domain/plan_repository.dart';
import 'package:planandact/features/plan_management/plan_model.dart';

class HivePlanRepository implements PlanRepository {
  HivePlanRepository(this._storage);

  final HivePlanStorage _storage;

  @override
  Future<List<PlanModel>> fetchPlans() async {
    final maps = _storage.readPlanMaps();
    return maps
        .map(PlanModel.fromMapWithMigration)
        .toList()
      ..sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
  }

  @override
  Future<void> savePlans(List<PlanModel> plans) {
    final serialized = plans.map((plan) => plan.toMap()).toList(growable: false);
    return _storage.writePlanMaps(serialized);
  }

  @override
  Future<void> addPlan(PlanModel plan) async {
    final plans = await fetchPlans();
    plans.add(plan);
    plans.sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
    await savePlans(plans);
  }
}
