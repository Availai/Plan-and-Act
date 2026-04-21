import 'package:drift/drift.dart';

/// Maps keywords to semantic buckets for the normalization pipeline.
class WisdomKeywordMap extends Table {
  TextColumn get id => text()();
  TextColumn get keyword => text()();
  TextColumn get semanticBucket => text()();
  RealColumn get confidence => real().withDefault(const Constant(1.0))();

  @override
  Set<Column> get primaryKey => {id};
}
