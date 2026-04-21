import 'package:drift/drift.dart';

/// Domain areas associated with historical figures (e.g. philosophy, military, science).
class FigureDomains extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Join table between historical_figures and figure_domains.
class HistoricalFigureDomains extends Table {
  TextColumn get figureId => text()();
  TextColumn get domainId => text()();

  @override
  Set<Column> get primaryKey => {figureId, domainId};
}
