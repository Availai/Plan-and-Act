import 'package:drift/drift.dart';

/// Join table between plans and tags (many-to-many).
class PlanTagLinks extends Table {
  TextColumn get planId => text()();
  TextColumn get tagId => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {planId, tagId};
}
