# Notifications Module

## Responsibility

Notification modulu plan reminder yasam dongusunu yonetir.

Sorumluluklari:

- plan olusunca reminder schedule etmek
- plan editlenince reschedule etmek
- plan silinince cancel etmek
- plan tamamlaninca veya ertelenince cancel ya da update etmek
- timezone-safe scheduling yapmak
- scheduling sonucunu local state olarak kaydetmek

## Domain Objects

### PlanReminder

- `id`
- `planId`
- `scheduledFor`
- `status`
- `notificationPayload`
- `lastScheduledAt?`
- `lastError?`

### ReminderStatus

- `scheduled`
- `delivered`
- `canceled`
- `failed`

### NotificationScheduleRequest

- `notificationId`
- `title`
- `body`
- `scheduledFor`
- `timezone`
- `payload`

## Service Abstraction

Domain/plugin coupling engellenmeli. Bu nedenle arayuz gerekir:

- `NotificationScheduler`

Beklenen metotlar:

- `schedulePlanReminder`
- `reschedulePlanReminder`
- `cancelPlanReminder`
- `cancelAllForPlan`

## Application Use Cases

- `SchedulePlanReminderUseCase`
- `ReschedulePlanReminderUseCase`
- `CancelPlanReminderUseCase`
- `HandlePlanReminderLifecycleUseCase`

Lifecycle event routing (deterministic):

- `created` -> schedule
- `edited` -> update (cancel + schedule if still actionable)
- `postponed` -> update
- `deleted` -> cancel
- `completed` -> cancel
- `canceled` -> cancel

## Data Policy

Notification state local-only tutulur:

- exact platform notification id
- son hata
- local payload
- scheduled state

Cloud tarafina tasinmasi gerekmez.

## Failure Handling

- plugin schedule basarisiz olursa local `failed` status yazilir
- plan kaydi rollback edilmez
- UI recoverable warning gosterebilir
- bir sonraki edit veya refresh akisi tekrar deneyebilir

## Test Scope

- create => schedule
- edit => reschedule
- delete => cancel
- complete => cancel
- postpone => reschedule
- timezone conversion correctness
