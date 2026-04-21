// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_breakdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreBreakdownImpl _$$ScoreBreakdownImplFromJson(Map<String, dynamic> json) =>
    _$ScoreBreakdownImpl(
      categoryMatch: (json['categoryMatch'] as num?)?.toDouble() ?? 0.0,
      urgency: (json['urgency'] as num?)?.toDouble() ?? 0.0,
      effortProfile: (json['effortProfile'] as num?)?.toDouble() ?? 0.0,
      behaviorState: (json['behaviorState'] as num?)?.toDouble() ?? 0.0,
      streak: (json['streak'] as num?)?.toDouble() ?? 0.0,
      toneAlignment: (json['toneAlignment'] as num?)?.toDouble() ?? 0.0,
      timeOfDay: (json['timeOfDay'] as num?)?.toDouble() ?? 0.0,
      personaAlignment: (json['personaAlignment'] as num?)?.toDouble() ?? 0.0,
      qualityBonus: (json['qualityBonus'] as num?)?.toDouble() ?? 0.0,
      diversityPenalty: (json['diversityPenalty'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ScoreBreakdownImplToJson(
  _$ScoreBreakdownImpl instance,
) => <String, dynamic>{
  'categoryMatch': instance.categoryMatch,
  'urgency': instance.urgency,
  'effortProfile': instance.effortProfile,
  'behaviorState': instance.behaviorState,
  'streak': instance.streak,
  'toneAlignment': instance.toneAlignment,
  'timeOfDay': instance.timeOfDay,
  'personaAlignment': instance.personaAlignment,
  'qualityBonus': instance.qualityBonus,
  'diversityPenalty': instance.diversityPenalty,
};
