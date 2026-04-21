import 'package:drift/drift.dart';

/// Core quotes table — the content pool for the Wisdom Engine.
class Quotes extends Table {
  TextColumn get id => text()();
  TextColumn get quoteText => text()();
  TextColumn get figureId => text()();
  TextColumn get sourceId => text().nullable()();
  TextColumn get languageCode => text().withDefault(const Constant('tr'))();

  /// Trust level: verified, attributed, uncertain, fake
  TextColumn get trustStatus => text().withDefault(const Constant('attributed'))();

  /// Attribution confidence 0.0 - 1.0
  RealColumn get attributionConfidence => real().withDefault(const Constant(0.8))();

  /// Tone label: calm, direct, intense, compassionate, strategic
  TextColumn get tone => text().withDefault(const Constant('direct'))();

  /// Max times this quote can be shown before cooldown
  IntColumn get usageFrequencyCap => integer().withDefault(const Constant(5))();

  /// Sensitivity notes (e.g. "avoid after repeated failure")
  TextColumn get sensitivityNotes => text().nullable()();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
