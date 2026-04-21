import 'package:planandact/core/errors/failure.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/notifications/application/services/notification_service.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/repositories/plan_repository.dart';

/// Creates a new plan and persists it.
///
/// Validates invariants before saving.
class CreatePlanUseCase {
  const CreatePlanUseCase(this._repository, this._notificationService);

  final PlanRepository _repository;
  final NotificationService _notificationService;

  Future<Result<PlanEntity>> call(PlanEntity plan) async {
    // Validate invariants
    if (plan.title.trim().isEmpty) {
      return const Err(ValidationFailure('Plan başlığı boş olamaz'));
    }

    if (plan.reminderEnabled && plan.reminderTimeLocal == null) {
      return const Err(
          ValidationFailure('Hatırlatıcı açık ise saat belirtilmeli'));
    }

    final result = await _repository.createPlan(plan);
    
    if (result is Success<PlanEntity>) {
      await _notificationService.scheduleForPlan(result.value);
    }

    return result;
  }
}
