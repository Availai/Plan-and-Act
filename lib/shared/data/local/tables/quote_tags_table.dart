import 'package:drift/drift.dart';

/// Semantic tags for quotes (e.g. discipline, resilience, deep_focus).
class QuoteTags extends Table {
  TextColumn get id => text()();
  TextColumn get slug => text().unique()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Join table between quotes and quote_tags.
class QuoteTagLinks extends Table {
  TextColumn get quoteId => text()();
  TextColumn get tagId => text()();
  RealColumn get relevanceWeight => real().withDefault(const Constant(1.0))();

  @override
  Set<Column> get primaryKey => {quoteId, tagId};
}
