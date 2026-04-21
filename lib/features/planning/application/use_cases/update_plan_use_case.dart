import 'package:planandact/core/errors/failure.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/notifications/application/services/notification_service.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/repositories/plan_repository.dart';

class UpdatePlanUseCase {
  const UpdatePlanUseCase(this._repository, this._notificationService);

  final PlanRepository _repository;
  final NotificationService _notificationService;

  Future<Result<PlanEntity>> call(PlanEntity plan) async {
    if (plan.title.trim().isEmpty) {
      return const Err(ValidationFailure('Plan başlığı boş olamaz'));
    }

    final result = await _repository.updatePlan(plan.copyWith(updatedAt: DateTime.now()));

    if (result is Success<PlanEntity>) {
      await _notificationService.updateForPlan(result.value);
    }

    return result;
  }
}
