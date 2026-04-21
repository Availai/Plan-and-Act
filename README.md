# Plan and Act

Plan and Act is a planning-first Flutter app focused on fast daily execution. The product is intentionally not a media feed and not a generic todo list. Its core loop is:

- create clear daily plans fast
- track execution with low friction
- surface deterministic, explainable wisdom for the next actionable task
- keep the UI dark, focused, and premium

## Current Product Direction

- planning-only scope
- no video subsystem
- dark-only Dracula Neon visual system
- deterministic wisdom engine instead of vague AI-style motivation
- local-first architecture with Drift

## Main Screens

1. `Today Dashboard`
   shows progress, calendar strip, next action card, wisdom card, and grouped plan lanes
2. `Plan Detail`
   shows status, priority, schedule, description, and completion actions
3. `Reflection`
   shows completed and missed plans
4. `Momentum`
   reserved for streak and rhythm metrics
5. `Stuck`
   reserved for repeated postponement recovery
6. `Settings`
   shows product configuration status, including locked Dracula Neon theme

## Tech Stack

- `Flutter`
- `Dart`
- `Material 3`
- `go_router`
- `flutter_riverpod`
- `freezed` + `json_serializable`
- `Drift` + SQLite
- `flutter_local_notifications`
- `timezone`

## Architecture

The project follows a layered structure:

- `presentation`
- `application`
- `domain`
- `data`
- `core`

Business rules stay out of widgets. The wisdom engine, planning flow, and notification lifecycle run through repositories and use cases instead of direct UI logic.

## Theme Direction

The app runs in dark-only mode and uses a Dracula-based neon palette:

- background `#282A36`
- panels `#1E1F29` and `#343746`
- text `#F8F8F2`
- accents `#8BE9FD`, `#FF79C6`, `#BD93F9`, `#50FA7B`, `#FFB86C`, `#FF5555`

Typography is split between `JetBrains Mono` for emphasis and `IBM Plex Sans` for body copy.

## Run

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Validation

```bash
flutter analyze
flutter test
```
