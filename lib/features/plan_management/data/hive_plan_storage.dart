import 'package:hive_flutter/hive_flutter.dart';

class HivePlanStorage {
  HivePlanStorage(this._box);

  static const String boxName = 'plans_box';
  static const String plansKey = 'plans';

  final Box<dynamic> _box;

  static Future<HivePlanStorage> create() async {
    await Hive.initFlutter();
    final box = await Hive.openBox<dynamic>(boxName);
    return HivePlanStorage(box);
  }

  List<Map<String, dynamic>> readPlanMaps() {
    final rawPlans = _box.get(plansKey, defaultValue: <dynamic>[]);
    if (rawPlans is! List) {
      return <Map<String, dynamic>>[];
    }

    return rawPlans
        .whereType<Map>()
        .map((item) => Map<String, dynamic>.from(item))
        .toList(growable: false);
  }

  Future<void> writePlanMaps(List<Map<String, dynamic>> serializedPlans) {
    return _box.put(plansKey, serializedPlans);
  }
}
