import 'package:flutter_test/flutter_test.dart';
import 'package:planandact/features/notifications/application/services/notification_service.dart';
import 'package:planandact/features/notifications/application/use_cases/handle_plan_reminder_lifecycle_use_case.dart';
import 'package:planandact/features/notifications/domain/services/notification_scheduler.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_priority.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';

class FakeNotificationScheduler implements NotificationScheduler {
  int scheduleCalls = 0;
  int rescheduleCalls = 0;
  int cancelCalls = 0;
  int cancelAllCalls = 0;

  @override
  Future<void> cancelAllForPlan(String planId) async {
    cancelAllCalls++;
  }

  @override
  Future<void> cancelPlanReminder(int notificationId) async {
    cancelCalls++;
  }

  @override
  Future<void> reschedulePlanReminder({
    required int notificationId,
    required String title,
    required String body,
    required DateTime scheduledFor,
    required String timezone,
    Map<String, String>? payload,
  }) async {
    rescheduleCalls++;
  }

  @override
  Future<void> schedulePlanReminder({
    required int notificationId,
    required String title,
    required String body,
    required DateTime scheduledFor,
    required String timezone,
    Map<String, String>? payload,
  }) async {
    scheduleCalls++;
  }
}

PlanEntity buildPlan({
  bool reminderEnabled = true,
  PlanStatus status = PlanStatus.planned,
}) {
  final scheduledAt = DateTime.now().toUtc().add(const Duration(hours: 2));
  return PlanEntity(
    id: 'plan_1',
    userId: 'user_1',
    title: 'Deep Work Block',
    description: 'Prepare architecture spec',
    scheduledDate: DateTime.utc(2026, 4, 21),
    scheduledTimeLocal: '10:00',
    scheduledTimezone: 'UTC',
    scheduledAtUtc: scheduledAt,
    priority: PlanPriority.high,
    status: status,
    reminderEnabled: reminderEnabled,
    reminderTimeLocal: '09:45',
    reminderAtUtc: scheduledAt.subtract(const Duration(minutes: 15)),
    createdAt: DateTime.utc(2026, 4, 21, 7),
    updatedAt: DateTime.utc(2026, 4, 21, 7),
  );
}

void main() {
  group('HandlePlanReminderLifecycleUseCase', () {
    test('created => schedules reminder', () async {
      final scheduler = FakeNotificationScheduler();
      final service = NotificationService(scheduler: scheduler);
      final useCase = HandlePlanReminderLifecycleUseCase(service);

      await useCase(
        event: PlanReminderLifecycleEvent.created,
        plan: buildPlan(),
      );

      expect(scheduler.scheduleCalls, 1);
      expect(scheduler.cancelCalls, 0);
    });

    test('edited => cancel + schedule via update', () async {
      final scheduler = FakeNotificationScheduler();
      final service = NotificationService(scheduler: scheduler);
      final useCase = HandlePlanReminderLifecycleUseCase(service);

      await useCase(
        event: PlanReminderLifecycleEvent.edited,
        plan: buildPlan(),
      );

      expect(scheduler.cancelCalls, 1);
      expect(scheduler.scheduleCalls, 1);
    });

    test('completed => cancels reminder', () async {
      final scheduler = FakeNotificationScheduler();
      final service = NotificationService(scheduler: scheduler);
      final useCase = HandlePlanReminderLifecycleUseCase(service);

      await useCase(
        event: PlanReminderLifecycleEvent.completed,
        plan: buildPlan(status: PlanStatus.completed),
      );

      expect(scheduler.cancelCalls, 1);
      expect(scheduler.scheduleCalls, 0);
    });
  });
}
