/// Abstract notification scheduling service.
///
/// Domain layer interface — implementation uses flutter_local_notifications
/// but the domain doesn't know that.
abstract class NotificationScheduler {
  /// Schedules a plan reminder notification.
  Future<void> schedulePlanReminder({
    required int notificationId,
    required String title,
    required String body,
    required DateTime scheduledFor,
    required String timezone,
    Map<String, String>? payload,
  });

  /// Reschedules an existing reminder.
  Future<void> reschedulePlanReminder({
    required int notificationId,
    required String title,
    required String body,
    required DateTime scheduledFor,
    required String timezone,
    Map<String, String>? payload,
  });

  /// Cancels a specific reminder.
  Future<void> cancelPlanReminder(int notificationId);

  /// Cancels all reminders for a plan.
  Future<void> cancelAllForPlan(String planId);
}
