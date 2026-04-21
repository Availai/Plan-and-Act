# Target File Map

## Active Structure

```text
lib/
  app/
    app.dart
    router/
    theme/
  core/
    constants/
    errors/
    logging/
    result/
    time/
  shared/
    data/
      local/
        app_database.dart
        converters/
        tables/
        daos/
  features/
    planning/
      domain/
      application/
      data/
      presentation/
    wisdom_engine/
      domain/
      application/
      data/
    notifications/
      domain/
      application/
      data/
    settings/
      presentation/
```

## Current Direction

- `video_of_the_day` is removed from the target map
- theme primitives live under `app/theme`
- screen backgrounds use the shared Dracula Neon backdrop
- `planning` owns the dashboard entry experience, including `NextActionCard`

## Near-Term Focus

1. keep planning flows stable
2. expand wisdom explainability
3. harden notifications
4. prepare sync-safe repositories
