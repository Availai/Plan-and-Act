import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';
import 'package:planandact/features/planning/domain/repositories/plan_repository.dart';
import 'package:planandact/features/planning/domain/repositories/plan_history_repository.dart';
import 'package:planandact/features/planning/domain/entities/plan_status_history_entry.dart';
import 'package:planandact/core/constants/app_constants.dart';

/// Postpones a plan to the next day and records the transition.
class PostponePlanUseCase {
  const PostponePlanUseCase(this._planRepo, this._historyRepo);

  final PlanRepository _planRepo;
  final PlanHistoryRepository _historyRepo;

  Future<Result<PlanEntity>> call(String planId) async {
    final planResult = await _planRepo.getPlanById(planId);
    switch (planResult) {
      case Err(:final failure):
        return Err(failure);
      case Success(:final value):
        final plan = value;
        final now = DateTime.now();

        final newScheduledDate = plan.scheduledDate
            .add(Duration(days: AppConstants.postponeOffsetDays));

        final updated = plan.copyWith(
          status: PlanStatus.postponed,
          postponedCount: plan.postponedCount + 1,
          scheduledDate: newScheduledDate,
          scheduledAtUtc: newScheduledDate,
          updatedAt: now,
          completedAt: null,
          version: plan.version + 1,
        );

        final updateResult = await _planRepo.updatePlan(updated);
        if (updateResult is Err) return updateResult;

        await _historyRepo.recordStatusChange(
          PlanStatusHistoryEntry(
            id: '${planId}_${now.millisecondsSinceEpoch}',
            planId: planId,
            userId: plan.userId,
            fromStatus: plan.status.name,
            toStatus: PlanStatus.postponed.name,
            changedAt: now,
          ),
        );

        return Success(updated);
    }
  }
}
