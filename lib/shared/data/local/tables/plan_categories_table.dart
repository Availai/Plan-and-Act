import 'package:drift/drift.dart';

/// Reference table for plan categories (e.g. deep_work, health, learning).
/// Server-owned: client receives categories from backend seed.
class PlanCategories extends Table {
  TextColumn get id => text()();
  TextColumn get slug => text().unique()();
  TextColumn get name => text()();
  TextColumn get iconKey => text().withDefault(const Constant('category'))();
  TextColumn get colorKey => text().withDefault(const Constant('primary'))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
