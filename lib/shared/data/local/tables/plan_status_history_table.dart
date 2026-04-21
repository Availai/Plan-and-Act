import 'package:drift/drift.dart';

/// Append-only audit log of plan status transitions.
class PlanStatusHistory extends Table {
  TextColumn get id => text()();
  TextColumn get planId => text()();
  TextColumn get userId => text()();
  TextColumn get fromStatus => text().nullable()();
  TextColumn get toStatus => text()();
  TextColumn get changeReason => text().nullable()();
  TextColumn get metadataJson => text().nullable()();
  DateTimeColumn get changedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
