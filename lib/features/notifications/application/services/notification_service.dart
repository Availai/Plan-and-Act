import 'package:planandact/core/logging/logger.dart';
import 'package:planandact/features/notifications/domain/services/notification_scheduler.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';

/// Bridges the domain concepts (Plans) to the infrastructure (Local Notifications).
class NotificationService {
  const NotificationService({
    required NotificationScheduler scheduler,
  }) : _scheduler = scheduler;

  final NotificationScheduler _scheduler;
  static const _tag = 'NotificationService';

  /// Generates a stable integer ID for a given string UUID.
  /// `flutter_local_notifications` requires exactly integers.
  int _generateIntegerId(String id) {
    // Basic hash code logic. Collision risk is low enough for local isolated reminders.
    return id.hashCode.abs();
  }

  /// Schedules a reminder if the plan has reminder enabled and a set UTC time.
  Future<void> scheduleForPlan(PlanEntity plan) async {
    if (!plan.reminderEnabled || plan.reminderAtUtc == null) {
      return;
    }

    // Only schedule if it's in the future
    if (plan.reminderAtUtc!.isBefore(DateTime.now().toUtc())) {
      AppLogger.debug(_tag, 'Skipped scheduling for ${plan.id} as time passed');
      return;
    }

    final intId = _generateIntegerId(plan.id);
    
    // In actual implementation, we might want to lookup the Title from Plan or use standard text
    final title = 'Hatırlatıcı: ${plan.title}';
    final body = plan.description.isNotEmpty ? plan.description : 'Planlanan vakit geldi. Başla ve Bitir.';

    try {
      await _scheduler.schedulePlanReminder(
        notificationId: intId,
        title: title,
        body: body,
        scheduledFor: plan.reminderAtUtc!.toLocal(), // Notifications plugin uses local timezone conversions
        timezone: plan.scheduledTimezone,
        payload: {'planId': plan.id},
      );
    } catch (e, st) {
      // We don't fail the use case if notification fails, just log it.
      AppLogger.error(_tag, 'scheduleForPlan failed for ${plan.id}', e, st);
    }
  }

  /// Cancels a scheduled reminder using just the plan ID.
  Future<void> cancelForPlanId(String planId) async {
    final intId = _generateIntegerId(planId);
    try {
      await _scheduler.cancelPlanReminder(intId);
    } catch (e, st) {
      AppLogger.error(_tag, 'cancelForPlanId failed for $planId', e, st);
    }
  }

  /// Cancels a scheduled reminder for a plan.
  Future<void> cancelForPlan(PlanEntity plan) async {
    await cancelForPlanId(plan.id);
  }

  /// Reschedules or Cancels a plan reminder based on its updated state.
  Future<void> updateForPlan(PlanEntity plan) async {
    // The easiest way is to cancel the existing one and schedule anew if needed.
    await cancelForPlan(plan);
    if (plan.reminderEnabled && plan.status.isActionable) {
      await scheduleForPlan(plan);
    }
  }
}
