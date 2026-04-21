import 'package:drift/drift.dart';
import 'package:planandact/shared/data/local/app_database.dart';
import 'package:planandact/shared/data/local/tables/historical_figures_table.dart';
import 'package:planandact/shared/data/local/tables/quote_sources_table.dart';
import 'package:planandact/shared/data/local/tables/quotes_table.dart';
import 'package:planandact/shared/data/local/tables/quote_tags_table.dart';
import 'package:planandact/shared/data/local/tables/quote_usage_history_table.dart';
import 'package:planandact/shared/data/local/tables/decision_logs_table.dart';

part 'wisdom_dao.g.dart';

/// Data access object for Wisdom Engine queries (Quotes, Usage, Decisions).
@DriftAccessor(tables: [
  Quotes,
  HistoricalFigures,
  QuoteSources,
  QuoteTags,
  QuoteTagLinks,
  QuoteUsageHistory,
  DecisionLogs,
  DecisionLogCandidates,
])
class WisdomDao extends DatabaseAccessor<AppDatabase> with _$WisdomDaoMixin {
  WisdomDao(super.db);

  /// Returns all active quotes optionally filtered by language.
  Future<List<Quote>> getActiveQuotes({String? languageCode, int? limit}) {
    var query = select(quotes)..where((q) => q.isActive.equals(true));

    if (languageCode != null) {
      query.where((q) => q.languageCode.equals(languageCode));
    }

    if (limit != null) {
      query.limit(limit);
    }

    return query.get();
  }

  /// Returns quotes that have at least one of the specified tag slugs.
  Future<List<Quote>> getQuotesByTagSlugs(List<String> tagSlugs) async {
    if (tagSlugs.isEmpty) return [];

    // Find tag IDs
    final tags = await (select(quoteTags)
          ..where((t) => t.slug.isIn(tagSlugs)))
        .get();

    if (tags.isEmpty) return [];

    final tagIds = tags.map((t) => t.id).toList();

    // Find distinct quote IDs linked to these tags
    final links = await (select(quoteTagLinks)
          ..where((l) => l.tagId.isIn(tagIds)))
        .get();

    final quoteIds = links.map((l) => l.quoteId).toSet().toList();

    if (quoteIds.isEmpty) return [];

    // Return the active quotes
    return (select(quotes)
          ..where((q) => q.id.isIn(quoteIds) & q.isActive.equals(true)))
        .get();
  }

  /// Returns a specific quote by ID.
  Future<Quote?> getQuoteById(String id) {
    return (select(quotes)..where((q) => q.id.equals(id))).getSingleOrNull();
  }

  /// Returns a specific historical figure by ID.
  Future<HistoricalFigure?> getHistoricalFigureById(String id) {
    return (select(historicalFigures)..where((f) => f.id.equals(id)))
        .getSingleOrNull();
  }

  /// Records that a quote was shown to a user.
  Future<void> insertQuoteUsage(QuoteUsageHistoryCompanion entry) {
    return into(quoteUsageHistory).insert(entry);
  }

  /// Returns the IDs of the most recently shown quotes for a user.
  Future<List<String>> getRecentQuoteIds(String userId, int limit) async {
    final rows = await (select(quoteUsageHistory)
          ..where((u) => u.userId.equals(userId))
          ..orderBy([(u) => OrderingTerm.desc(u.shownAt)])
          ..limit(limit))
        .get();
    return rows.map((r) => r.quoteId).toSet().toList(); // toSet removes dupes if any
  }

  /// Finds historical figure IDs for recently shown quotes.
  Future<List<String>> getRecentFigureIds(String userId, int limit) async {
    final recentUsage = await (select(quoteUsageHistory)
          ..where((u) => u.userId.equals(userId))
          ..orderBy([(u) => OrderingTerm.desc(u.shownAt)])
          ..limit(limit))
        .get();

    if (recentUsage.isEmpty) return [];

    final quoteIds = recentUsage.map((u) => u.quoteId).toList();

    final recentQuotes = await (select(quotes)
          ..where((q) => q.id.isIn(quoteIds)))
        .get();

    return recentQuotes.map((q) => q.figureId).toSet().toList();
  }

  /// Returns how many times a given quote has been shown to a given user.
  Future<int> getQuoteUsageCount(String userId, String quoteId) async {
    final countExp = quoteUsageHistory.id.count();
    final query = selectOnly(quoteUsageHistory)
      ..addColumns([countExp])
      ..where(quoteUsageHistory.userId.equals(userId) &
          quoteUsageHistory.quoteId.equals(quoteId));

    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  /// Inserts a decision log for analytics and debugging.
  Future<void> insertDecisionLog(
      DecisionLogsCompanion log, List<DecisionLogCandidatesCompanion> candidates) {
    return transaction(() async {
      final logId = log.id.value;
      await into(decisionLogs).insert(log);

      for (var candidate in candidates) {
        await into(decisionLogCandidates).insert(candidate.copyWith(
          id: Value('${logId}_${candidate.quoteId.value}'),
          decisionLogId: Value(logId),
        ));
      }
    });
  }

  /// Returns recent decisions.
  Future<List<DecisionLog>> getRecentDecisions(String userId, int limit) {
    return (select(decisionLogs)
          ..where((d) => d.userId.equals(userId))
          ..orderBy([(d) => OrderingTerm.desc(d.createdAt)])
          ..limit(limit))
        .get();
  }
}
