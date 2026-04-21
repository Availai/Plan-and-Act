import 'package:planandact/features/notifications/application/services/notification_service.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';

enum PlanReminderLifecycleEvent {
  created,
  edited,
  deleted,
  completed,
  postponed,
  canceled,
}

class HandlePlanReminderLifecycleUseCase {
  const HandlePlanReminderLifecycleUseCase(this._notificationService);

  final NotificationService _notificationService;

  Future<void> call({
    required PlanReminderLifecycleEvent event,
    required PlanEntity plan,
  }) {
    switch (event) {
      case PlanReminderLifecycleEvent.created:
        return _notificationService.scheduleForPlan(plan);
      case PlanReminderLifecycleEvent.edited:
      case PlanReminderLifecycleEvent.postponed:
        return _notificationService.updateForPlan(plan);
      case PlanReminderLifecycleEvent.deleted:
      case PlanReminderLifecycleEvent.completed:
      case PlanReminderLifecycleEvent.canceled:
        return _notificationService.cancelForPlan(plan);
    }
  }
}
