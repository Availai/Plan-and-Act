import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/notifications/application/providers/notification_providers.dart';
import 'package:planandact/features/planning/application/providers/plan_repository_provider.dart';
import 'package:planandact/features/planning/application/use_cases/create_plan_use_case.dart';
import 'package:planandact/features/planning/application/use_cases/delete_plan_use_case.dart';
import 'package:planandact/features/planning/application/use_cases/mark_plan_completed_use_case.dart';
import 'package:planandact/features/planning/data/repositories/drift_plan_history_repository.dart';
import 'package:planandact/features/planning/domain/repositories/plan_history_repository.dart';
import 'package:planandact/features/planning/application/providers/database_provider.dart';

// Provides history repo
final planHistoryRepositoryProvider = Provider<PlanHistoryRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DriftPlanHistoryRepository(db: db);
});

final createPlanUseCaseProvider = Provider<CreatePlanUseCase>((ref) {
  final repo = ref.watch(planRepositoryProvider);
  final notificationService = ref.watch(notificationServiceProvider);
  return CreatePlanUseCase(repo, notificationService);
});

final deletePlanUseCaseProvider = Provider<DeletePlanUseCase>((ref) {
  final repo = ref.watch(planRepositoryProvider);
  final notificationService = ref.watch(notificationServiceProvider);
  return DeletePlanUseCase(repo, notificationService);
});

final markPlanCompletedUseCaseProvider = Provider<MarkPlanCompletedUseCase>((ref) {
  final planRepo = ref.watch(planRepositoryProvider);
  final historyRepo = ref.watch(planHistoryRepositoryProvider);
  final notificationService = ref.watch(notificationServiceProvider);
  return MarkPlanCompletedUseCase(planRepo, historyRepo, notificationService);
});
