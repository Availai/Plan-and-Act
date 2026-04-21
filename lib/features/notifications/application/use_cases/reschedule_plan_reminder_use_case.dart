import 'package:planandact/features/notifications/application/services/notification_service.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';

class ReschedulePlanReminderUseCase {
  const ReschedulePlanReminderUseCase(this._notificationService);

  final NotificationService _notificationService;

  Future<void> call(PlanEntity plan) {
    return _notificationService.updateForPlan(plan);
  }
}
