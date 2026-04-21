import 'package:drift/drift.dart';

/// Configurable scoring weights for the Wisdom Engine.
class WisdomRuleWeights extends Table {
  TextColumn get id => text()();
  TextColumn get dimensionKey => text().unique()(); // e.g. 'category_match', 'urgency'
  RealColumn get weight => real()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
