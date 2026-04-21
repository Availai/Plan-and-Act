import 'package:planandact/core/errors/failure.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/notifications/application/services/notification_service.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';
import 'package:planandact/features/planning/domain/repositories/plan_repository.dart';
import 'package:planandact/features/planning/domain/repositories/plan_history_repository.dart';
import 'package:planandact/features/planning/domain/entities/plan_status_history_entry.dart';

/// Marks a plan as completed and records the status transition.
class MarkPlanCompletedUseCase {
  const MarkPlanCompletedUseCase(this._planRepo, this._historyRepo, this._notificationService);

  final PlanRepository _planRepo;
  final PlanHistoryRepository _historyRepo;
  final NotificationService _notificationService;

  Future<Result<PlanEntity>> call(String planId) async {
    final planResult = await _planRepo.getPlanById(planId);
    switch (planResult) {
      case Err(:final failure):
        return Err(failure);
      case Success(:final value):
        final plan = value;

        if (plan.status == PlanStatus.canceled) {
          return const Err(
              ValidationFailure('İptal edilmiş plan tamamlanamaz'));
        }

        if (plan.status == PlanStatus.completed) {
          return const Err(
              ValidationFailure('Plan zaten tamamlanmış'));
        }

        final now = DateTime.now();
        final updated = plan.copyWith(
          status: PlanStatus.completed,
          completedAt: now,
          updatedAt: now,
          version: plan.version + 1,
        );

        final updateResult = await _planRepo.updatePlan(updated);
        if (updateResult is Err) return updateResult;

        // Cancel reminder since task is done
        await _notificationService.cancelForPlanId(planId);

        // Record history (fire-and-forget, don't block on failure)
        await _historyRepo.recordStatusChange(
          PlanStatusHistoryEntry(
            id: '${planId}_${now.millisecondsSinceEpoch}',
            planId: planId,
            userId: plan.userId,
            fromStatus: plan.status.name,
            toStatus: PlanStatus.completed.name,
            changedAt: now,
          ),
        );

        return Success(updated);
    }
  }
}
