import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_priority.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';

part 'plan_entity.freezed.dart';
part 'plan_entity.g.dart';

/// Core domain entity for a user plan.
///
/// This is the aggregate root of the planning module.
/// Invariants:
/// - title must not be empty
/// - if reminderEnabled is true, reminderTimeLocal must not be null
/// - if status is completed, completedAt must not be null
/// - a canceled plan cannot become completed
@freezed
class PlanEntity with _$PlanEntity {
  const PlanEntity._();

  const factory PlanEntity({
    required String id,
    required String userId,
    required String title,
    @Default('') String description,

    // Scheduling
    required DateTime scheduledDate,
    required String scheduledTimeLocal,
    @Default('Europe/Istanbul') String scheduledTimezone,
    required DateTime scheduledAtUtc,
    int? durationMinutes,

    // Classification
    String? categoryId,
    @Default(PlanPriority.medium) PlanPriority priority,
    @Default(PlanStatus.planned) PlanStatus status,

    // Reminder
    @Default(false) bool reminderEnabled,
    String? reminderTimeLocal,
    DateTime? reminderAtUtc,

    // Tracking
    @Default(0) int postponedCount,
    String? motivationContextSnapshot,

    // Audit
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? completedAt,
    DateTime? deletedAt,
    @Default(1) int version,
  }) = _PlanEntity;

  factory PlanEntity.fromJson(Map<String, dynamic> json) =>
      _$PlanEntityFromJson(json);

  /// Whether this plan is overdue (scheduled time has passed and still actionable).
  bool get isOverdue =>
      status.isActionable && scheduledAtUtc.isBefore(DateTime.now());

  /// Whether this plan is considered "stuck" (postponed 2+ times).
  bool get isStuck => postponedCount >= 2;

  /// Whether this plan has been soft-deleted.
  bool get isDeleted => deletedAt != null;
}
