import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:planandact/app/app.dart';
import 'package:planandact/app/theme/app_theme.dart';
import 'package:planandact/features/notifications/application/providers/notification_providers.dart';
import 'package:planandact/features/notifications/domain/services/notification_scheduler.dart';
import 'package:planandact/features/planning/application/providers/database_provider.dart';
import 'package:planandact/features/planning/presentation/screens/today_screen.dart';
import 'package:planandact/features/settings/presentation/screens/settings_screen.dart';
import 'package:planandact/shared/data/local/app_database.dart';

class _FakeNotificationScheduler implements NotificationScheduler {
  @override
  Future<void> cancelAllForPlan(String planId) async {}

  @override
  Future<void> cancelPlanReminder(int notificationId) async {}

  @override
  Future<void> reschedulePlanReminder({
    required int notificationId,
    required String title,
    required String body,
    required DateTime scheduledFor,
    required String timezone,
    Map<String, String>? payload,
  }) async {}

  @override
  Future<void> schedulePlanReminder({
    required int notificationId,
    required String title,
    required String body,
    required DateTime scheduledFor,
    required String timezone,
    Map<String, String>? payload,
  }) async {}

  @override
  Future<void> showNow({
    required int notificationId,
    required String title,
    required String body,
    Map<String, String>? payload,
  }) async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initializeDateFormatting('tr', null);
  });

  Future<AppDatabase> createTestDatabase({bool withPlan = false}) async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('select 1').get();

    if (withPlan) {
      final now = DateTime(2026, 4, 21, 9);
      await db.into(db.plans).insert(
            PlansCompanion.insert(
              id: 'plan-1',
              userId: 'local_user',
              title: 'Derin calisma blogu',
              description: const Value('Mimari akisi toparla'),
              scheduledDate: DateTime(2026, 4, 21),
              scheduledTimeLocal: '09:30',
              scheduledAtUtc: now.toUtc(),
              categoryId: const Value('must_do'),
              priority: const Value('high'),
              createdAt: now,
              updatedAt: now,
            ),
          );
    }

    return db;
  }

  testWidgets('PlanAndActApp runs in dark-only mode', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: PlanAndActApp(),
      ),
    );

    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.themeMode, ThemeMode.dark);
  });

  testWidgets('Today dashboard shows next action card and no video card', (tester) async {
    final db = await createTestDatabase(withPlan: true);
    addTearDown(db.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(db),
          notificationSchedulerProvider.overrideWithValue(_FakeNotificationScheduler()),
        ],
        child: MaterialApp(
          theme: AppTheme.theme,
          home: const TodayScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Siradaki Aksiyon'), findsOneWidget);
    expect(find.text('Derin calisma blogu'), findsOneWidget);
    expect(find.textContaining('VIDEO'), findsNothing);
  });

  testWidgets('Settings screen states Dracula Neon and does not mention system theme', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.theme,
        home: const SettingsScreen(),
      ),
    );

    expect(find.textContaining('Dracula Neon'), findsOneWidget);
    expect(find.textContaining('sistem'), findsNothing);
  });
}
