import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/notifications/application/services/notification_service.dart';
import 'package:planandact/features/notifications/application/use_cases/cancel_plan_reminder_use_case.dart';
import 'package:planandact/features/notifications/application/use_cases/handle_plan_reminder_lifecycle_use_case.dart';
import 'package:planandact/features/notifications/application/use_cases/reschedule_plan_reminder_use_case.dart';
import 'package:planandact/features/notifications/application/use_cases/schedule_plan_reminder_use_case.dart';
import 'package:planandact/features/notifications/data/services/flutter_local_notification_scheduler.dart';
import 'package:planandact/features/notifications/domain/services/notification_scheduler.dart';

/// Provides the base infrastructure scheduler.
final notificationSchedulerProvider = Provider<NotificationScheduler>((ref) {
  // Return the initialized instance
  return FlutterLocalNotificationScheduler();
});

/// Provides the domain-level notification service.
final notificationServiceProvider = Provider<NotificationService>((ref) {
  final scheduler = ref.watch(notificationSchedulerProvider);
  return NotificationService(scheduler: scheduler);
});

final schedulePlanReminderUseCaseProvider =
    Provider<SchedulePlanReminderUseCase>((ref) {
  final service = ref.watch(notificationServiceProvider);
  return SchedulePlanReminderUseCase(service);
});

final reschedulePlanReminderUseCaseProvider =
    Provider<ReschedulePlanReminderUseCase>((ref) {
  final service = ref.watch(notificationServiceProvider);
  return ReschedulePlanReminderUseCase(service);
});

final cancelPlanReminderUseCaseProvider = Provider<CancelPlanReminderUseCase>((ref) {
  final service = ref.watch(notificationServiceProvider);
  return CancelPlanReminderUseCase(service);
});

final handlePlanReminderLifecycleUseCaseProvider =
    Provider<HandlePlanReminderLifecycleUseCase>((ref) {
  final service = ref.watch(notificationServiceProvider);
  return HandlePlanReminderLifecycleUseCase(service);
});
