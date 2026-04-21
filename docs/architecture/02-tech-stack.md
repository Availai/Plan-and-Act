# Tech Stack

## Final Recommendation

### Frontend

- `Flutter`
- `Dart`
- `Material 3`
- `go_router`
- `flutter_riverpod`
- `riverpod_annotation`
- `riverpod_generator`
- `freezed`
- `json_serializable`

### Local Data

- `Drift`
- `sqlite3_flutter_libs`
- `path_provider`
- `path`

### Networking / Remote

- `dio`
- `supabase_flutter`

### Notifications / Time

- `flutter_local_notifications`
- `timezone`

## Why This Stack

### Flutter + Material 3

Correct for a mobile-first product that needs fast iteration and a premium UI base.

### go_router

Needed for a clear route model across Today, Detail, Reflection, Momentum, Stuck, and Settings flows.

### Riverpod

Fits async repositories, notification lifecycle orchestration, and the wisdom engine better than widget-local state.

### Drift

Required because the product needs relational queries for:

- plans
- status history
- quotes
- rule weights
- usage history
- decision logs
- notifications

### Supabase + Postgres

Still the right remote direction for sync, auth, seed data, and analytics because the data is relational.

## Theme Foundation

The UI stack is now dark-only and centered on a Dracula Neon palette with semantically named tokens instead of mixed ad-hoc colors.
