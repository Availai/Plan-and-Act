import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_breakdown.freezed.dart';
part 'score_breakdown.g.dart';

/// Detailed score breakdown for a quote candidate.
///
/// Each dimension is a 0.0–1.0 subscore.
@freezed
class ScoreBreakdown with _$ScoreBreakdown {
  const factory ScoreBreakdown({
    @Default(0.0) double categoryMatch,
    @Default(0.0) double urgency,
    @Default(0.0) double effortProfile,
    @Default(0.0) double behaviorState,
    @Default(0.0) double streak,
    @Default(0.0) double toneAlignment,
    @Default(0.0) double timeOfDay,
    @Default(0.0) double personaAlignment,
    @Default(0.0) double qualityBonus,
    @Default(0.0) double diversityPenalty,
  }) = _ScoreBreakdown;

  factory ScoreBreakdown.fromJson(Map<String, dynamic> json) =>
      _$ScoreBreakdownFromJson(json);
}
