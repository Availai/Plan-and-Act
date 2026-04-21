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

### Dev Tooling

- `build_runner`
- `drift_dev`
- `freezed_annotation`
- `json_annotation`

## Why This Stack

### Flutter + Material 3

Dogru secim cunku mobil-first, hizli iterasyon ve premium UI foundation hedefiyle uyumlu.

### go_router

Today Dashboard, Plan Detail, Settings, History, Video ve gelecekte Auth akislari icin route state'in acik ve test edilebilir olmasi gerekir.

### Riverpod + generator

Bu proje basit UI state tasimiyor. Async repository akisi, notification orchestration, cache fallback ve rule engine girdileri icin provider tabanli ve generated wiring daha bakimli.

### Drift

En kritik karar budur. Bu urun key-value storage degil, queryable relational data ister:

- planlar
- status history
- quote catalog
- quote usage
- decision logs
- notification state
- video cache

### Supabase + Postgres

Quote, source, tag, rule weights, analytics ve sync tarafinda relational model document store'dan daha dogal.

## Rejected Choices

### SharedPreferences as primary storage

Kucuk ayarlar icin kalabilir ama plan ana depolama katmani olamaz.

### Bloc

Riverpod zaten mevcut ve bu proje icin yeterli. Ek state framework gereksiz ceremony uretir.

### Hive / Isar

Hizli olabilirler ama bu urunun ihtiyaci:

- iliskisel query
- joins
- auditability
- migration discipline

Bu nedenle Drift daha dogru.

### AI-generated quotes

Bu asamada yanlis yatirim olur. Urun hedefi deterministic ve explainable secimdir.

## Current Gap From Repo

Repoda hali hazirda olanlar:

- `flutter_riverpod`
- `shared_preferences`
- `flutter_local_notifications`
- `timezone`

Eksik olanlar:

- `go_router`
- `drift`
- `freezed`
- `json_serializable`
- `dio`
- `supabase_flutter`

## Migration Direction

1. Plan storage `SharedPreferences`'tan cikacak
2. Drift local schema kurulacak
3. Entity / DTO / table ayrimi netlestirilecek
4. Generated provider yapisina gecilecek
5. Remote sync katmani Supabase uzerinde stub olarak hazirlanacak
