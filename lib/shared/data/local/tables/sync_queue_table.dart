import 'package:drift/drift.dart';

/// Local-only sync queue for offline-first write operations.
class SyncQueue extends Table {
  TextColumn get id => text()();
  TextColumn get targetTable => text()();
  TextColumn get rowId => text()();
  TextColumn get operation => text()(); // insert, update, delete
  TextColumn get payloadJson => text()();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastAttemptAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
