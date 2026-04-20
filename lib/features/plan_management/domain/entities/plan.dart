import 'dart:convert';

class Plan {
  final String id;
  final String title;
  final String description;
  final DateTime scheduledTime;
  final String? assignedWisdom;

  const Plan({
    required this.id,
    required this.title,
    required this.description,
    required this.scheduledTime,
    this.assignedWisdom,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'scheduledTime': scheduledTime.toIso8601String(),
      'assignedWisdom': assignedWisdom,
    };
  }

  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      scheduledTime: DateTime.parse(map['scheduledTime'] as String),
      assignedWisdom: map['assignedWisdom'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Plan.fromJson(String source) =>
      Plan.fromMap(json.decode(source) as Map<String, dynamic>);
}
