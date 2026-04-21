import 'package:drift/drift.dart';

/// Streak snapshot — daily completion record for momentum tracking.
class StreakSnapshots extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  DateTimeColumn get snapshotDate => dateTime()();
  IntColumn get completedCount => integer().withDefault(const Constant(0))();
  IntColumn get totalCount => integer().withDefault(const Constant(0))();
  IntColumn get currentStreak => integer().withDefault(const Constant(0))();
  IntColumn get longestStreak => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
