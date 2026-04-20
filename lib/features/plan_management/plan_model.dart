import 'dart:convert';

class PlanModel {
  static const int currentSchemaVersion = 2;

  final String id;
  final String title;
  final String description;
  final DateTime scheduledTime;
  final String? assignedWisdom;

  PlanModel({
    required this.id,
    required this.title,
    required this.description,
    required this.scheduledTime,
    this.assignedWisdom,
  });

  Map<String, dynamic> toMap() {
    return {
      'schemaVersion': currentSchemaVersion,
      'id': id,
      'title': title,
      'description': description,
      'scheduledTime': scheduledTime.toIso8601String(),
      'assignedWisdom': assignedWisdom,
    };
  }

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
      id: map['id'] as String,
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      scheduledTime: DateTime.parse(map['scheduledTime'] as String),
      assignedWisdom: map['assignedWisdom'] as String?,
    );
  }

  factory PlanModel.fromMapWithMigration(Map<String, dynamic> rawMap) {
    final migratedMap = _migrateMap(rawMap);
    return PlanModel.fromMap(migratedMap);
  }

  static Map<String, dynamic> _migrateMap(Map<String, dynamic> rawMap) {
    final schemaVersion = rawMap['schemaVersion'] as int? ?? 1;
    final migrated = Map<String, dynamic>.from(rawMap);

    if (schemaVersion < 2) {
      migrated['schemaVersion'] = 2;

      final scheduledTime = migrated['scheduledTime'];
      if (scheduledTime is int) {
        migrated['scheduledTime'] =
            DateTime.fromMillisecondsSinceEpoch(scheduledTime).toIso8601String();
      }

      migrated['assignedWisdom'] = migrated['assignedWisdom'];
      migrated['description'] = migrated['description'] ?? '';
    }

    return migrated;
  }

  String toJson() => json.encode(toMap());

  factory PlanModel.fromJson(String source) {
    final map = Map<String, dynamic>.from(json.decode(source) as Map);
    return PlanModel.fromMapWithMigration(map);
  }
}
