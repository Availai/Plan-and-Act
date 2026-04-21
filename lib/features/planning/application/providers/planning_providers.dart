import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/application/providers/plan_repository_provider.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';

/// Default local user ID until auth is implemented.
const _defaultUserId = 'local_user';

/// Main plans state provider — watches today's plans reactively.
final todayPlansProvider =
    StreamProvider.autoDispose<List<PlanEntity>>((ref) {
  final repo = ref.watch(planRepositoryProvider);
  return repo.watchPlansForDate(_defaultUserId, DateTime.now());
});

/// Provider for adding a new plan.
final addPlanProvider =
    FutureProvider.autoDispose.family<Result<PlanEntity>, PlanEntity>(
  (ref, plan) async {
    final repo = ref.read(planRepositoryProvider);
    return repo.createPlan(plan);
  },
);

/// Provider for toggling plan completion.
final completePlanProvider =
    FutureProvider.autoDispose.family<void, String>((ref, planId) async {
  final repo = ref.read(planRepositoryProvider);
  final result = await repo.getPlanById(planId);
  switch (result) {
    case Success(:final value):
      final now = DateTime.now();
      final updated = value.copyWith(
        status: PlanStatus.completed,
        completedAt: now,
        updatedAt: now,
        version: value.version + 1,
      );
      await repo.updatePlan(updated);
    case Err():
      break;
  }
});

/// Provider for postponing a plan.
final postponePlanProvider =
    FutureProvider.autoDispose.family<void, String>((ref, planId) async {
  final repo = ref.read(planRepositoryProvider);
  final result = await repo.getPlanById(planId);
  switch (result) {
    case Success(:final value):
      final now = DateTime.now();
      final newDate =
          value.scheduledDate.add(const Duration(days: 1));
      final updated = value.copyWith(
        status: PlanStatus.postponed,
        postponedCount: value.postponedCount + 1,
        scheduledDate: newDate,
        scheduledAtUtc: newDate,
        updatedAt: now,
        completedAt: null,
        version: value.version + 1,
      );
      await repo.updatePlan(updated);
    case Err():
      break;
  }
});
