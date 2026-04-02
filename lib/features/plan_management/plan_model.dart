import 'dart:convert';

class PlanModel {
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

  // Modeli JSON formatına çevirme (Kaydederken kullanacağız)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'scheduledTime': scheduledTime.toIso8601String(),
      'assignedWisdom': assignedWisdom,
    };
  }

  // JSON formatından Modeli okuma (Uygulama açıldığında kullanacağız)
  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      scheduledTime: DateTime.parse(map['scheduledTime']),
      assignedWisdom: map['assignedWisdom'],
    );
  }

  // Liste halinde kaydetmek için String'e çevirme araçları
  String toJson() => json.encode(toMap());
  factory PlanModel.fromJson(String source) =>
      PlanModel.fromMap(json.decode(source));
}
