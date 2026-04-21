// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanReminderImpl _$$PlanReminderImplFromJson(Map<String, dynamic> json) =>
    _$PlanReminderImpl(
      id: json['id'] as String,
      planId: json['planId'] as String,
      scheduledFor: DateTime.parse(json['scheduledFor'] as String),
      status:
          $enumDecodeNullable(_$ReminderStatusEnumMap, json['status']) ??
          ReminderStatus.scheduled,
      notificationPayload: json['notificationPayload'] as String,
      lastScheduledAt: json['lastScheduledAt'] == null
          ? null
          : DateTime.parse(json['lastScheduledAt'] as String),
      lastError: json['lastError'] as String?,
    );

Map<String, dynamic> _$$PlanReminderImplToJson(_$PlanReminderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'scheduledFor': instance.scheduledFor.toIso8601String(),
      'status': _$ReminderStatusEnumMap[instance.status]!,
      'notificationPayload': instance.notificationPayload,
      'lastScheduledAt': instance.lastScheduledAt?.toIso8601String(),
      'lastError': instance.lastError,
    };

const _$ReminderStatusEnumMap = {
  ReminderStatus.scheduled: 'scheduled',
  ReminderStatus.delivered: 'delivered',
  ReminderStatus.canceled: 'canceled',
  ReminderStatus.failed: 'failed',
};
