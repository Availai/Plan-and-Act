import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_priority.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/tone.dart';

part 'wisdom_context.freezed.dart';
part 'wisdom_context.g.dart';

/// Input context assembled for the Wisdom Engine pipeline.
///
/// This is the single input object the engine processes.
@freezed
class WisdomContext with _$WisdomContext {
  const WisdomContext._();

  const factory WisdomContext({
    required String planId,
    required String userId,
    required String title,
    @Default('') String description,
    required DateTime scheduledAt,
    int? durationMinutes,
    String? categorySlug,
    @Default(PlanPriority.medium) PlanPriority priority,
    @Default(PlanStatus.planned) PlanStatus currentStatus,
    @Default(0) int currentStreak,
    @Default(1.0) double recentCompletionRate7d,
    @Default(0) int recentPostponementCount7d,
    @Default(0) int recentSkipCount7d,
    required String timeOfDaySegment, // morning, afternoon, night
    @Default(Tone.direct) Tone preferredTone,
    @Default([]) List<String> recentQuoteIds,
    @Default([]) List<String> recentFigureIds,
    @Default([]) List<String> recentSemanticBuckets,
    @Default('tr') String locale,
    @Default('Europe/Istanbul') String timezone,
  }) = _WisdomContext;

  factory WisdomContext.fromJson(Map<String, dynamic> json) =>
      _$WisdomContextFromJson(json);

  /// Derived: estimated task size based on duration.
  String get taskSize {
    if (durationMinutes == null) return 'medium';
    if (durationMinutes! <= 15) return 'small';
    if (durationMinutes! <= 60) return 'medium';
    return 'large';
  }

  /// Derived: urgency band based on schedule proximity.
  String get urgencyBand {
    final hoursUntil = scheduledAt.difference(DateTime.now()).inHours;
    if (hoursUntil < 0) return 'overdue';
    if (hoursUntil <= 1) return 'imminent';
    if (hoursUntil <= 4) return 'upcoming';
    return 'relaxed';
  }

  /// Derived: behavioral state based on recent patterns.
  String get behaviorState {
    if (recentPostponementCount7d >= 5) return 'struggling';
    if (recentCompletionRate7d >= 0.8 && currentStreak >= 3) return 'thriving';
    if (recentCompletionRate7d >= 0.5) return 'steady';
    return 'recovering';
  }
}
