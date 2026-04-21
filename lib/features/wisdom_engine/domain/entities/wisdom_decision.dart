import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/fallback_tier.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/score_breakdown.dart';

part 'wisdom_decision.freezed.dart';
part 'wisdom_decision.g.dart';

/// Output of a Wisdom Engine decision.
///
/// Contains the selected quote plus full explainability metadata.
@freezed
class WisdomDecision with _$WisdomDecision {
  const factory WisdomDecision({
    String? selectedQuoteId,
    String? selectedQuoteText,
    String? historicalFigureName,
    String? sourceReference,
    @Default([]) List<String> selectedCategories,
    @Default(FallbackTier.exactMatch) FallbackTier fallbackTier,
    @Default(0.0) double finalScore,
    ScoreBreakdown? scoreBreakdown,
    @Default([]) List<RejectedCandidate> topRejectedCandidates,
    @Default('') String userFacingExplanation,
    @Default('') String debugExplanation,
    required DateTime decisionTimestamp,
  }) = _WisdomDecision;

  factory WisdomDecision.fromJson(Map<String, dynamic> json) =>
      _$WisdomDecisionFromJson(json);
}

/// A rejected quote candidate with reason.
@freezed
class RejectedCandidate with _$RejectedCandidate {
  const factory RejectedCandidate({
    required String quoteId,
    required double score,
    required String rejectionReason,
  }) = _RejectedCandidate;

  factory RejectedCandidate.fromJson(Map<String, dynamic> json) =>
      _$RejectedCandidateFromJson(json);
}
