import 'package:planandact/features/notifications/application/services/notification_service.dart';

class CancelPlanReminderUseCase {
  const CancelPlanReminderUseCase(this._notificationService);

  final NotificationService _notificationService;

  Future<void> call(String planId) {
    return _notificationService.cancelForPlanId(planId);
  }
}
