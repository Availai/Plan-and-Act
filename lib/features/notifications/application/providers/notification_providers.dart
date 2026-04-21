import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/notifications/application/services/notification_service.dart';
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
