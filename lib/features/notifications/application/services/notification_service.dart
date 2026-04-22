import 'package:planandact/core/logging/logger.dart';
import 'package:planandact/features/notifications/domain/services/notification_scheduler.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';

/// Bridges the domain concepts (Plans) to the infrastructure (Local Notifications).
///
/// Every actionable plan receives three unconditional notifications:
/// 1. Immediate "plan created" alert
/// 2. Reminder 2 hours before [PlanEntity.scheduledAtUtc]
/// 3. Reminder 30 minutes before [PlanEntity.scheduledAtUtc]
class NotificationService {
  const NotificationService({
    required NotificationScheduler scheduler,
  }) : _scheduler = scheduler;

  final NotificationScheduler _scheduler;
  static const _tag = 'NotificationService';

  static const _slotCreated = 'created';
  static const _slotTwoHour = 'two_hour';
  static const _slotHalfHour = 'half_hour';

  static const List<String> _allSlots = [
    _slotCreated,
    _slotTwoHour,
    _slotHalfHour,
  ];

  /// Deterministic 32-bit-safe ID from a plan + slot pair.
  int _idFor(String planId, String slot) {
    return ('$planId:$slot').hashCode.abs() & 0x7FFFFFFF;
  }

  /// Schedules creation + 2h + 30m reminders for [plan].
  ///
  /// Fires immediately for the creation slot; schedules the pre-due slots only
  /// if they still fall in the future. No-op when the plan is not actionable.
  Future<void> scheduleForPlan(PlanEntity plan) async {
    if (!plan.status.isActionable) {
      AppLogger.debug(_tag, 'Skip scheduling ${plan.id}: not actionable');
      return;
    }

    final title = 'Plan: ${plan.title}';
    final body = plan.description.isNotEmpty
        ? plan.description
        : 'Plan programa eklendi.';
    final payload = {'planId': plan.id};

    // 1. Immediate "created" notification
    try {
      await _scheduler.showNow(
        notificationId: _idFor(plan.id, _slotCreated),
        title: 'Yeni plan: ${plan.title}',
        body: body,
        payload: payload,
      );
    } catch (e, st) {
      AppLogger.error(_tag, 'showNow failed for ${plan.id}', e, st);
    }

    final nowUtc = DateTime.now().toUtc();
    final twoHourMark = plan.scheduledAtUtc.subtract(const Duration(hours: 2));
    final halfHourMark = plan.scheduledAtUtc.subtract(const Duration(minutes: 30));

    // 2. Two-hour warning
    if (twoHourMark.isAfter(nowUtc)) {
      try {
        await _scheduler.schedulePlanReminder(
          notificationId: _idFor(plan.id, _slotTwoHour),
          title: title,
          body: '2 saat kaldı. ${plan.title}',
          scheduledFor: twoHourMark.toLocal(),
          timezone: plan.scheduledTimezone,
          payload: payload,
        );
      } catch (e, st) {
        AppLogger.error(_tag, '2h schedule failed for ${plan.id}', e, st);
      }
    }

    // 3. Half-hour warning
    if (halfHourMark.isAfter(nowUtc)) {
      try {
        await _scheduler.schedulePlanReminder(
          notificationId: _idFor(plan.id, _slotHalfHour),
          title: title,
          body: '30 dakika kaldı. ${plan.title}',
          scheduledFor: halfHourMark.toLocal(),
          timezone: plan.scheduledTimezone,
          payload: payload,
        );
      } catch (e, st) {
        AppLogger.error(_tag, '30m schedule failed for ${plan.id}', e, st);
      }
    }
  }

  /// Cancels every scheduled slot for [planId].
  Future<void> cancelForPlanId(String planId) async {
    for (final slot in _allSlots) {
      try {
        await _scheduler.cancelPlanReminder(_idFor(planId, slot));
      } catch (e, st) {
        AppLogger.error(_tag, 'cancel $slot failed for $planId', e, st);
      }
    }
  }

  Future<void> cancelForPlan(PlanEntity plan) => cancelForPlanId(plan.id);

  /// Cancels any existing reminders for the plan and, when still actionable,
  /// schedules the full creation + 2h + 30m set anew.
  Future<void> updateForPlan(PlanEntity plan) async {
    await cancelForPlan(plan);
    if (plan.status.isActionable) {
      await scheduleForPlan(plan);
    }
  }
}
