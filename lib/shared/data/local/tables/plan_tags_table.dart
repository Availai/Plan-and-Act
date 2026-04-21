import 'package:drift/drift.dart';

/// User-defined tags that can be attached to plans.
class PlanTags extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get label => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
