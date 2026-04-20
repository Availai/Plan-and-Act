import 'package:planandact/features/plan_management/plan_model.dart';

abstract class PlanRepository {
  Future<List<PlanModel>> fetchPlans();
  Future<void> savePlans(List<PlanModel> plans);
  Future<void> addPlan(PlanModel plan);
}
