// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wisdom_decision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WisdomDecisionImpl _$$WisdomDecisionImplFromJson(
  Map<String, dynamic> json,
) => _$WisdomDecisionImpl(
  selectedQuoteId: json['selectedQuoteId'] as String?,
  selectedQuoteText: json['selectedQuoteText'] as String?,
  historicalFigureName: json['historicalFigureName'] as String?,
  sourceReference: json['sourceReference'] as String?,
  selectedCategories:
      (json['selectedCategories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  fallbackTier:
      $enumDecodeNullable(_$FallbackTierEnumMap, json['fallbackTier']) ??
      FallbackTier.exactMatch,
  finalScore: (json['finalScore'] as num?)?.toDouble() ?? 0.0,
  scoreBreakdown: json['scoreBreakdown'] == null
      ? null
      : ScoreBreakdown.fromJson(json['scoreBreakdown'] as Map<String, dynamic>),
  topRejectedCandidates:
      (json['topRejectedCandidates'] as List<dynamic>?)
          ?.map((e) => RejectedCandidate.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  userFacingExplanation: json['userFacingExplanation'] as String? ?? '',
  debugExplanation: json['debugExplanation'] as String? ?? '',
  decisionTimestamp: DateTime.parse(json['decisionTimestamp'] as String),
);

Map<String, dynamic> _$$WisdomDecisionImplToJson(
  _$WisdomDecisionImpl instance,
) => <String, dynamic>{
  'selectedQuoteId': instance.selectedQuoteId,
  'selectedQuoteText': instance.selectedQuoteText,
  'historicalFigureName': instance.historicalFigureName,
  'sourceReference': instance.sourceReference,
  'selectedCategories': instance.selectedCategories,
  'fallbackTier': _$FallbackTierEnumMap[instance.fallbackTier]!,
  'finalScore': instance.finalScore,
  'scoreBreakdown': instance.scoreBreakdown,
  'topRejectedCandidates': instance.topRejectedCandidates,
  'userFacingExplanation': instance.userFacingExplanation,
  'debugExplanation': instance.debugExplanation,
  'decisionTimestamp': instance.decisionTimestamp.toIso8601String(),
};

const _$FallbackTierEnumMap = {
  FallbackTier.exactMatch: 'exactMatch',
  FallbackTier.closeMatch: 'closeMatch',
  FallbackTier.genericExecution: 'genericExecution',
  FallbackTier.safeFallback: 'safeFallback',
  FallbackTier.neutralEncouragement: 'neutralEncouragement',
};

_$RejectedCandidateImpl _$$RejectedCandidateImplFromJson(
  Map<String, dynamic> json,
) => _$RejectedCandidateImpl(
  quoteId: json['quoteId'] as String,
  score: (json['score'] as num).toDouble(),
  rejectionReason: json['rejectionReason'] as String,
);

Map<String, dynamic> _$$RejectedCandidateImplToJson(
  _$RejectedCandidateImpl instance,
) => <String, dynamic>{
  'quoteId': instance.quoteId,
  'score': instance.score,
  'rejectionReason': instance.rejectionReason,
};
