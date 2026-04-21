import 'package:drift/drift.dart';

/// Records each Wisdom Engine decision for analytics and debugging.
class DecisionLogs extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get planId => text()();
  TextColumn get selectedQuoteId => text().nullable()();
  IntColumn get candidatePoolSize => integer().withDefault(const Constant(0))();
  IntColumn get fallbackTier => integer().withDefault(const Constant(1))();
  RealColumn get finalScore => real().withDefault(const Constant(0.0))();
  TextColumn get contextFeaturesJson => text().nullable()(); // serialized WisdomContext
  TextColumn get userFacingExplanation => text().nullable()();
  TextColumn get debugExplanation => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Top candidates considered during a decision (for score breakdown).
class DecisionLogCandidates extends Table {
  TextColumn get id => text()();
  TextColumn get decisionLogId => text()();
  TextColumn get quoteId => text()();
  RealColumn get totalScore => real()();
  TextColumn get scoreBreakdownJson => text().nullable()();
  TextColumn get rejectionReason => text().nullable()();
  IntColumn get rank => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
