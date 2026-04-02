import 'package:shared_preferences/shared_preferences.dart';
import 'package:planandact/features/plan_management/plan_model.dart';
import 'package:planandact/core/storage_service.dart';

class StorageService {
  static const String _plansKey = 'my_saved_plans';

  // Planları Kaydet
  static Future<void> savePlans(List<PlanModel> plans) async {
    final prefs = await SharedPreferences.getInstance();

    // Plan listesini String (Metin) listesine çeviriyoruz
    List<String> stringPlans = plans.map((plan) => plan.toJson()).toList();

    await prefs.setStringList(_plansKey, stringPlans);
  }

  // Planları Oku (Uygulama açıldığında)
  static Future<List<PlanModel>> loadPlans() async {
    final prefs = await SharedPreferences.getInstance();

    // Kayıtlı metin listesini al
    List<String>? stringPlans = prefs.getStringList(_plansKey);

    if (stringPlans == null) {
      return []; // Hiç kayıt yoksa boş liste dön
    }

    // Metinleri tekrar PlanModel'e çevirip listele
    return stringPlans
        .map((planString) => PlanModel.fromJson(planString))
        .toList();
  }
}
