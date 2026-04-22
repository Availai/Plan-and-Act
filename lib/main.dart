import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:planandact/app/app.dart';
import 'package:planandact/core/time/timezone_service.dart';
import 'package:planandact/features/notifications/application/providers/notification_providers.dart';
import 'package:planandact/features/notifications/data/services/flutter_local_notification_scheduler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TimezoneService.initialize();
  await initializeDateFormatting('tr_TR', null);

  final notificationScheduler = FlutterLocalNotificationScheduler();
  await notificationScheduler.initialize();

  runApp(
    ProviderScope(
      overrides: [
        notificationSchedulerProvider.overrideWithValue(notificationScheduler),
      ],
      child: const PlanAndActApp(),
    ),
  );
}
