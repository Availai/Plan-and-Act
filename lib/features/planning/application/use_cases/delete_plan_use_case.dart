import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/notifications/application/services/notification_service.dart';
import 'package:planandact/features/planning/domain/repositories/plan_repository.dart';

/// Soft-deletes a plan.
class DeletePlanUseCase {
  const DeletePlanUseCase(this._repository, this._notificationService);

  final PlanRepository _repository;
  final NotificationService _notificationService;

  Future<Result<void>> call(String planId) async {
    final result = await _repository.deletePlan(planId);
    if (result is Success) {
      await _notificationService.cancelForPlanId(planId);
    }
    return result;
  }
}
