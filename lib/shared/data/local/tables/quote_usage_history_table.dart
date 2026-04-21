import 'package:drift/drift.dart';

/// Tracks which quotes were shown to which user and when.
class QuoteUsageHistory extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get quoteId => text()();
  TextColumn get planId => text().nullable()();
  DateTimeColumn get shownAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
