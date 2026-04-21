import 'package:drift/drift.dart';

/// Historical figures who authored quotes.
class HistoricalFigures extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get era => text().nullable()(); // e.g. "Ancient Rome", "20th Century"
  TextColumn get shortBio => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
