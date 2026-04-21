import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:planandact/core/logging/logger.dart';
import 'package:planandact/features/notifications/domain/services/notification_scheduler.dart';
import 'package:timezone/timezone.dart' as tz;

/// flutter_local_notifications implementation of [NotificationScheduler].
class FlutterLocalNotificationScheduler implements NotificationScheduler {
  FlutterLocalNotificationScheduler({
    FlutterLocalNotificationsPlugin? plugin,
  }) : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  static const _tag = 'NotificationScheduler';

  static const _androidChannel = AndroidNotificationDetails(
    'plan_reminders',
    'Plan Hatırlatıcıları',
    channelDescription: 'Planlanmış görev hatırlatıcıları',
    importance: Importance.high,
    priority: Priority.high,
  );

  static const _notificationDetails = NotificationDetails(
    android: _androidChannel,
    iOS: DarwinNotificationDetails(),
  );

  /// Must be called once during app initialization.
  Future<void> initialize() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _plugin.initialize(
      settings: const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );
    AppLogger.info(_tag, 'Notification plugin initialized');
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
    try {
      final location = tz.getLocation(timezone);
      final tzScheduledFor = tz.TZDateTime.from(scheduledFor, location);

      await _plugin.zonedSchedule(
        id: notificationId,
        title: title,
        body: body,
        scheduledDate: tzScheduledFor,
        notificationDetails: _notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );

      AppLogger.debug(
          _tag, 'Scheduled notification $notificationId for $tzScheduledFor');
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to schedule notification', e, st);
      rethrow;
    }
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
    await cancelPlanReminder(notificationId);
    await schedulePlanReminder(
      notificationId: notificationId,
      title: title,
      body: body,
      scheduledFor: scheduledFor,
      timezone: timezone,
      payload: payload,
    );
  }

  @override
  Future<void> cancelPlanReminder(int notificationId) async {
    await _plugin.cancel(id: notificationId);
    AppLogger.debug(_tag, 'Canceled notification $notificationId');
  }

  @override
  Future<void> cancelAllForPlan(String planId) async {
    // flutter_local_notifications doesn't support cancel-by-tag,
    // so the caller must track notification IDs per plan.
    AppLogger.warning(
        _tag, 'cancelAllForPlan requires caller to provide notification IDs');
  }
}
