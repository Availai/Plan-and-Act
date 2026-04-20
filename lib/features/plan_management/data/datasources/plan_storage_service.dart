import 'package:planandact/features/plan_management/domain/entities/plan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanStorageService {
  static const String _plansKey = 'my_saved_plans';

  static Future<void> savePlans(List<Plan> plans) async {
    final prefs = await SharedPreferences.getInstance();
    final stringPlans = plans.map((plan) => plan.toJson()).toList();
    await prefs.setStringList(_plansKey, stringPlans);
  }

  static Future<List<Plan>> loadPlans() async {
    final prefs = await SharedPreferences.getInstance();
    final stringPlans = prefs.getStringList(_plansKey);

    if (stringPlans == null) {
      return [];
    }

    return stringPlans.map(Plan.fromJson).toList();
  }
}
