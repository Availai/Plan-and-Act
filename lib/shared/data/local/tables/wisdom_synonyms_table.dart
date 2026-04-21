import 'package:drift/drift.dart';

/// Synonym dictionary: maps alternative words to canonical terms.
class WisdomSynonyms extends Table {
  TextColumn get id => text()();
  TextColumn get word => text()();
  TextColumn get canonicalTerm => text()();

  @override
  Set<Column> get primaryKey => {id};
}
