import 'package:planandact/core/logging/logger.dart';
import 'package:planandact/features/wisdom_engine/data/mappers/wisdom_mapper.dart';
import 'package:planandact/features/wisdom_engine/domain/entities/quote_entity.dart';
import 'package:planandact/features/wisdom_engine/domain/entities/wisdom_decision.dart';
import 'package:planandact/features/wisdom_engine/domain/repositories/quote_repository.dart';
import 'package:planandact/features/wisdom_engine/domain/repositories/quote_usage_repository.dart';
import 'package:planandact/features/wisdom_engine/domain/repositories/wisdom_decision_repository.dart';
import 'package:drift/drift.dart' as drift;
import 'package:planandact/shared/data/local/app_database.dart';
import 'package:planandact/shared/data/local/daos/wisdom_dao.dart';

/// Drift-backed implementation of all Wisdom Engine domain repositories.
class DriftWisdomRepository
    implements
        QuoteRepository,
        QuoteUsageRepository,
        WisdomDecisionRepository {
  DriftWisdomRepository({
    required WisdomDao dao,
    WisdomMapper mapper = const WisdomMapper(),
  })  : _dao = dao,
        _mapper = mapper;

  final WisdomDao _dao;
  final WisdomMapper _mapper;
  static const _tag = 'DriftWisdomRepository';

  // --- QuoteRepository ---

  @override
  Future<List<QuoteEntity>> getActiveQuotes({String? languageCode, int? limit}) async {
    try {
      final rows = await _dao.getActiveQuotes(languageCode: languageCode, limit: limit);
      return _mapper.toQuoteEntityList(rows);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to fetch active quotes', e, st);
      return [];
    }
  }

  @override
  Future<List<QuoteEntity>> getQuotesByTagSlugs(List<String> tagSlugs) async {
    try {
      final rows = await _dao.getQuotesByTagSlugs(tagSlugs);
      return _mapper.toQuoteEntityList(rows);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to fetch quotes by tag slugs', e, st);
      return [];
    }
  }

  @override
  Future<QuoteEntity?> getQuoteById(String quoteId) async {
    try {
      final row = await _dao.getQuoteById(quoteId);
      if (row == null) return null;
      return _mapper.toQuoteEntity(row);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to fetch quote by ID', e, st);
      return null;
    }
  }

  // --- QuoteUsageRepository ---

  @override
  Future<void> recordUsage({
    required String userId,
    required String quoteId,
    String? planId,
  }) async {
    try {
      final companion = QuoteUsageHistoryCompanion.insert(
        id: '${userId}_${quoteId}_${DateTime.now().millisecondsSinceEpoch}',
        userId: userId,
        quoteId: quoteId,
        planId: drift.Value(planId),
        shownAt: DateTime.now(),
      );
      await _dao.insertQuoteUsage(companion);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to record quote usage', e, st);
    }
  }

  @override
  Future<List<String>> getRecentQuoteIds(String userId, int windowSize) {
    return _dao.getRecentQuoteIds(userId, windowSize);
  }

  @override
  Future<List<String>> getRecentFigureIds(String userId, int windowSize) {
    return _dao.getRecentFigureIds(userId, windowSize);
  }

  @override
  Future<int> getUsageCount(String userId, String quoteId) {
    return _dao.getQuoteUsageCount(userId, quoteId);
  }

  // --- WisdomDecisionRepository ---

  @override
  Future<void> logDecision(WisdomDecision decision) async {
    try {
      final logCompanion = _mapper.toDecisionLogCompanion(decision);
      
      // Map candidates
      final candidateCompanions = decision.topRejectedCandidates.map((c) {
        return DecisionLogCandidatesCompanion.insert(
          id: '', // Set by Dao
          decisionLogId: '', // Set by Dao
          quoteId: c.quoteId,
          totalScore: c.score,
          rejectionReason: drift.Value(c.rejectionReason),
          rank: 0, // In future, use index for explicit rank
        );
      }).toList();

      await _dao.insertDecisionLog(logCompanion, candidateCompanions);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to log wisdom decision', e, st);
    }
  }

  @override
  Future<List<WisdomDecision>> getRecentDecisions(String userId, int limit) async {
    try {
      final rows = await _dao.getRecentDecisions(userId, limit);
      // NOTE: For now, we return empty due to missing full mapping 
      // (WisdomDecision has large nested logic). Add if needed for UI later.
      AppLogger.info(_tag, 'Retrieved ${rows.length} decisions (mapping not fully implemented for read)');
      return []; 
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to fetch recent decisions', e, st);
      return [];
    }
  }
}
