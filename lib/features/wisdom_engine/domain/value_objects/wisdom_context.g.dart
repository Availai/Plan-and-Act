// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wisdom_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WisdomContextImpl _$$WisdomContextImplFromJson(Map<String, dynamic> json) =>
    _$WisdomContextImpl(
      planId: json['planId'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
      categorySlug: json['categorySlug'] as String?,
      priority:
          $enumDecodeNullable(_$PlanPriorityEnumMap, json['priority']) ??
          PlanPriority.medium,
      currentStatus:
          $enumDecodeNullable(_$PlanStatusEnumMap, json['currentStatus']) ??
          PlanStatus.planned,
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      recentCompletionRate7d:
          (json['recentCompletionRate7d'] as num?)?.toDouble() ?? 1.0,
      recentPostponementCount7d:
          (json['recentPostponementCount7d'] as num?)?.toInt() ?? 0,
      recentSkipCount7d: (json['recentSkipCount7d'] as num?)?.toInt() ?? 0,
      timeOfDaySegment: json['timeOfDaySegment'] as String,
      preferredTone:
          $enumDecodeNullable(_$ToneEnumMap, json['preferredTone']) ??
          Tone.direct,
      recentQuoteIds:
          (json['recentQuoteIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recentFigureIds:
          (json['recentFigureIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recentSemanticBuckets:
          (json['recentSemanticBuckets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      locale: json['locale'] as String? ?? 'tr',
      timezone: json['timezone'] as String? ?? 'Europe/Istanbul',
    );

Map<String, dynamic> _$$WisdomContextImplToJson(_$WisdomContextImpl instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'scheduledAt': instance.scheduledAt.toIso8601String(),
      'durationMinutes': instance.durationMinutes,
      'categorySlug': instance.categorySlug,
      'priority': _$PlanPriorityEnumMap[instance.priority]!,
      'currentStatus': _$PlanStatusEnumMap[instance.currentStatus]!,
      'currentStreak': instance.currentStreak,
      'recentCompletionRate7d': instance.recentCompletionRate7d,
      'recentPostponementCount7d': instance.recentPostponementCount7d,
      'recentSkipCount7d': instance.recentSkipCount7d,
      'timeOfDaySegment': instance.timeOfDaySegment,
      'preferredTone': _$ToneEnumMap[instance.preferredTone]!,
      'recentQuoteIds': instance.recentQuoteIds,
      'recentFigureIds': instance.recentFigureIds,
      'recentSemanticBuckets': instance.recentSemanticBuckets,
      'locale': instance.locale,
      'timezone': instance.timezone,
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

const _$ToneEnumMap = {
  Tone.calm: 'calm',
  Tone.direct: 'direct',
  Tone.intense: 'intense',
  Tone.compassionate: 'compassionate',
  Tone.strategic: 'strategic',
};
