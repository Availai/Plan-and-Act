# Target File Map

Bu dosya Phase 2 kod uretimine gecildiginde yazilacak hedef dosya yapisini tanimlar.

## Proposed Structure

```text
lib/
  app/
    app.dart
    router/
      app_router.dart
      route_names.dart
  core/
    constants/
      app_constants.dart
    errors/
      app_exception.dart
      failure.dart
    logging/
      logger.dart
    result/
      result.dart
    time/
      date_time_provider.dart
      timezone_service.dart
    theme/
      app_theme.dart
      app_colors.dart
  shared/
    data/
      local/
        app_database.dart
        converters/
        tables/
        daos/
      remote/
        supabase/
          supabase_client_provider.dart
          supabase_tables.dart
  features/
    planning/
      domain/
        entities/
          plan.dart
          plan_category.dart
          plan_status_history_entry.dart
        repositories/
          plan_repository.dart
          plan_category_repository.dart
          plan_history_repository.dart
        value_objects/
          plan_priority.dart
          plan_status.dart
      application/
        providers/
        use_cases/
      data/
        dtos/
        mappers/
        repositories/
        local/
        remote/
      presentation/
        screens/
        widgets/
    wisdom_engine/
      domain/
        entities/
          quote.dart
          historical_figure.dart
          wisdom_decision.dart
        repositories/
          quote_repository.dart
          quote_usage_repository.dart
          wisdom_decision_repository.dart
        value_objects/
          wisdom_context.dart
          score_breakdown.dart
      application/
        providers/
        use_cases/
          select_motivational_quote_use_case.dart
          build_wisdom_context_use_case.dart
      data/
        dtos/
        mappers/
        repositories/
        local/
        remote/
      domain_services/
        text_normalizer.dart
        semantic_bucket_extractor.dart
        hard_filter_engine.dart
        quote_scorer.dart
        diversity_policy.dart
        explanation_builder.dart
    video_of_the_day/
      domain/
      application/
      data/
      presentation/
    notifications/
      domain/
        entities/
          plan_reminder.dart
        repositories/
          reminder_repository.dart
        services/
          notification_scheduler.dart
      application/
        use_cases/
      data/
        local/
        services/
          flutter_local_notification_scheduler.dart
    settings/
      domain/
      application/
      data/
      presentation/
```

## Existing -> Target Mapping

- `features/plan_management` -> `features/planning`
- `features/wisdom_engine/wisdom_service.dart` -> `features/wisdom_engine/domain_services/*`
- `plan_storage_service.dart` -> Drift local repository implementasyonu

## Phase 2 Initial Write Set

Kod yazimi basladiginda ilk olusturulacak dosyalar:

1. `pubspec.yaml` dependency updates
2. `lib/shared/data/local/app_database.dart`
3. `lib/shared/data/local/tables/*`
4. `lib/features/planning/domain/*`
5. `lib/features/planning/data/*`
6. `lib/features/wisdom_engine/domain/*`
7. `lib/features/wisdom_engine/application/*`
8. `lib/features/notifications/domain/services/notification_scheduler.dart`

## Intentional Hold Point

Bu nokta kod uretimine gecis kapisidir.

Bu dokuman seti onaylanmadan:

- klasor refactor baslatilmayacak
- dependency eklenmeyecek
- Drift kurulmayacak
- mevcut feature dosyalari tasinmayacak

Bu sayede Phase 2 degisiklikleri mimari onaydan sonra kontrollu baslar.
