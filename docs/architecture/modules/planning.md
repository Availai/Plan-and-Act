# Planning Module

## Responsibility

Planning modulu su akislardan sorumludur:

- plan olusturma
- plan guncelleme
- plan silme
- plan tamamlama
- plan erteleme
- plan iptal etme
- status history tutma
- reminder ihtiyacini application katmanina bildirme

## Aggregate Root

Ana aggregate root `Plan` olmalidir.

Zorunlu alanlar:

- `id`
- `userId`
- `title`
- `description`
- `scheduledDate`
- `scheduledTimeLocal`
- `scheduledTimezone`
- `scheduledAtUtc`
- `durationMinutes?`
- `categoryId?`
- `priority`
- `status`
- `reminderEnabled`
- `reminderTimeLocal?`
- `reminderAtUtc?`
- `postponedCount`
- `motivationContextSnapshot?`
- `createdAt`
- `updatedAt`
- `completedAt?`
- `deletedAt?`
- `version`

## Supporting Models

### PlanStatus

- `planned`
- `completed`
- `skipped`
- `postponed`
- `canceled`

### PlanPriority

- `low`
- `medium`
- `high`
- `critical`

### PlanCategory

Enum yerine reference entity tutulur:

- `id`
- `slug`
- `name`
- `iconKey`
- `colorKey`
- `isActive`

### PlanStatusHistoryEntry

- `id`
- `planId`
- `userId`
- `fromStatus?`
- `toStatus`
- `changeReason?`
- `metadataJson?`
- `changedAt`

## Derived Concepts

Su kavramlar entity degil, query/read model veya domain service ciktilaridir:

- `overdue`
- `today plan list`
- `stuck plan`
- `momentum`
- `completion summary`

## Invariants

- title bos olamaz
- `reminderEnabled = true` ise reminder zamani bos olamaz
- `completed` status'unde `completedAt` dolu olmali
- `canceled` bir plan tekrar `completed` olamaz
- `overdue` ayrica status olarak tutulmaz

## Application Use Cases

- `CreatePlanUseCase`
- `UpdatePlanUseCase`
- `DeletePlanUseCase`
- `MarkPlanCompletedUseCase`
- `SkipPlanUseCase`
- `PostponePlanUseCase`
- `CancelPlanUseCase`
- `GetTodayPlansUseCase`
- `GetPlanDetailUseCase`
- `RefreshPlanningDashboardUseCase`

## Repository Contracts

- `PlanRepository`
- `PlanHistoryRepository`
- `PlanCategoryRepository`
- `PlanTagRepository`

## Local Storage Needs

Planning modulu local tarafta su tablolara dayanir:

- `plans`
- `plan_categories`
- `plan_tags`
- `plan_tag_links`
- `plan_status_history`
- `streak_snapshots`

## Interaction With Other Modules

- `notifications`: reminder scheduling icin
- `wisdom_engine`: motivation context ve quote selection icin
- `analytics`: status degisimi, completion, postpone ve dashboard interaction icin

## UI Scope

Planning modulu icin zorunlu ekranlar:

- `Today Dashboard`
- `Add/Edit Plan Sheet`
- `Plan Detail`
- `History / Reflection`

Bu modulde presentation katmani dogrudan storage'a baglanmaz.
