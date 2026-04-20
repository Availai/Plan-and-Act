import 'dart:convert';

enum PlanCategory { deepWork, health, learning, personal, admin }

enum PlanStatus { pending, completed, postponed }

class Plan {
  final String id;
  final String title;
  final String description;
  final DateTime scheduledTime;
  final String? assignedWisdom;
  final PlanCategory category;
  final PlanStatus status;
  final int postponeCount;
  final DateTime createdAt;
  final DateTime? completedAt;

  const Plan({
    required this.id,
    required this.title,
    required this.description,
    required this.scheduledTime,
    this.assignedWisdom,
    this.category = PlanCategory.personal,
    this.status = PlanStatus.pending,
    this.postponeCount = 0,
    required this.createdAt,
    this.completedAt,
  });

  Plan copyWith({
    String? title,
    String? description,
    DateTime? scheduledTime,
    String? assignedWisdom,
    PlanCategory? category,
    PlanStatus? status,
    int? postponeCount,
    DateTime? createdAt,
    DateTime? completedAt,
    bool clearCompletedAt = false,
  }) {
    return Plan(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      assignedWisdom: assignedWisdom ?? this.assignedWisdom,
      category: category ?? this.category,
      status: status ?? this.status,
      postponeCount: postponeCount ?? this.postponeCount,
      createdAt: createdAt ?? this.createdAt,
      completedAt: clearCompletedAt ? null : completedAt ?? this.completedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'scheduledTime': scheduledTime.toIso8601String(),
      'assignedWisdom': assignedWisdom,
      'category': category.name,
      'status': status.name,
      'postponeCount': postponeCount,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  factory Plan.fromMap(Map<String, dynamic> map) {
    final categoryName = map['category'] as String?;
    final statusName = map['status'] as String?;

    return Plan(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String? ?? '',
      scheduledTime: DateTime.parse(map['scheduledTime'] as String),
      assignedWisdom: map['assignedWisdom'] as String?,
      category: PlanCategory.values.firstWhere(
        (value) => value.name == categoryName,
        orElse: () => _inferCategory('${map['title'] ?? ''} ${map['description'] ?? ''}'),
      ),
      status: PlanStatus.values.firstWhere(
        (value) => value.name == statusName,
        orElse: () => PlanStatus.pending,
      ),
      postponeCount: map['postponeCount'] as int? ?? 0,
      createdAt: DateTime.tryParse(map['createdAt'] as String? ?? '') ??
          DateTime.parse(map['scheduledTime'] as String),
      completedAt: map['completedAt'] == null
          ? null
          : DateTime.tryParse(map['completedAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Plan.fromJson(String source) =>
      Plan.fromMap(json.decode(source) as Map<String, dynamic>);

  static PlanCategory _inferCategory(String text) {
    final value = text.toLowerCase();
    if (value.contains('ders') || value.contains('okuma') || value.contains('öğren')) {
      return PlanCategory.learning;
    }
    if (value.contains('spor') || value.contains('koş') || value.contains('yürüy')) {
      return PlanCategory.health;
    }
    if (value.contains('mail') || value.contains('evrak') || value.contains('fatura')) {
      return PlanCategory.admin;
    }
    if (value.contains('proje') || value.contains('odak') || value.contains('kod')) {
      return PlanCategory.deepWork;
    }
    return PlanCategory.personal;
  }
}
