import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_reminder.freezed.dart';
part 'plan_reminder.g.dart';

/// Domain entity for a scheduled plan reminder.
@freezed
class PlanReminder with _$PlanReminder {
  const factory PlanReminder({
    required String id,
    required String planId,
    required DateTime scheduledFor,
    @Default(ReminderStatus.scheduled) ReminderStatus status,
    required String notificationPayload,
    DateTime? lastScheduledAt,
    String? lastError,
  }) = _PlanReminder;

  factory PlanReminder.fromJson(Map<String, dynamic> json) =>
      _$PlanReminderFromJson(json);
}

/// Status of a scheduled notification.
enum ReminderStatus {
  scheduled,
  delivered,
  canceled,
  failed,
}
