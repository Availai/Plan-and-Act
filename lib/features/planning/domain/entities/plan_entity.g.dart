// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanEntityImpl _$$PlanEntityImplFromJson(Map<String, dynamic> json) =>
    _$PlanEntityImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      scheduledTimeLocal: json['scheduledTimeLocal'] as String,
      scheduledTimezone:
          json['scheduledTimezone'] as String? ?? 'Europe/Istanbul',
      scheduledAtUtc: DateTime.parse(json['scheduledAtUtc'] as String),
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
      categoryId: json['categoryId'] as String?,
      priority:
          $enumDecodeNullable(_$PlanPriorityEnumMap, json['priority']) ??
          PlanPriority.medium,
      status:
          $enumDecodeNullable(_$PlanStatusEnumMap, json['status']) ??
          PlanStatus.planned,
      reminderEnabled: json['reminderEnabled'] as bool? ?? false,
      reminderTimeLocal: json['reminderTimeLocal'] as String?,
      reminderAtUtc: json['reminderAtUtc'] == null
          ? null
          : DateTime.parse(json['reminderAtUtc'] as String),
      postponedCount: (json['postponedCount'] as num?)?.toInt() ?? 0,
      motivationContextSnapshot: json['motivationContextSnapshot'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$PlanEntityImplToJson(_$PlanEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'scheduledDate': instance.scheduledDate.toIso8601String(),
      'scheduledTimeLocal': instance.scheduledTimeLocal,
      'scheduledTimezone': instance.scheduledTimezone,
      'scheduledAtUtc': instance.scheduledAtUtc.toIso8601String(),
      'durationMinutes': instance.durationMinutes,
      'categoryId': instance.categoryId,
      'priority': _$PlanPriorityEnumMap[instance.priority]!,
      'status': _$PlanStatusEnumMap[instance.status]!,
      'reminderEnabled': instance.reminderEnabled,
      'reminderTimeLocal': instance.reminderTimeLocal,
      'reminderAtUtc': instance.reminderAtUtc?.toIso8601String(),
      'postponedCount': instance.postponedCount,
      'motivationContextSnapshot': instance.motivationContextSnapshot,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'version': instance.version,
    };

const _$PlanPriorityEnumMap = {
  PlanPriority.low: 'low',
  PlanPriority.medium: 'medium',
  PlanPriority.high: 'high',
  PlanPriority.critical: 'critical',
};

const _$PlanStatusEnumMap = {
  PlanStatus.planned: 'planned',
  PlanStatus.completed: 'completed',
  PlanStatus.skipped: 'skipped',
  PlanStatus.postponed: 'postponed',
  PlanStatus.canceled: 'canceled',
};
