import 'package:drift/drift.dart';

/// Trusted sources of quotes (books, speeches, letters, etc.).
class QuoteSources extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get sourceType => text().withDefault(const Constant('book'))(); // book, speech, letter, interview
  TextColumn get url => text().nullable()();
  BoolColumn get isTrusted => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
