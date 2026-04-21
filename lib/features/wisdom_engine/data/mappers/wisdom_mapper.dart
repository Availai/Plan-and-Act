import 'package:planandact/features/wisdom_engine/domain/entities/historical_figure_entity.dart';
import 'package:planandact/features/wisdom_engine/domain/entities/quote_entity.dart';
import 'package:planandact/features/wisdom_engine/domain/entities/wisdom_decision.dart';
import 'package:drift/drift.dart' as drift;
import 'package:planandact/shared/data/local/app_database.dart';

/// Maps between Drift models and Domain entities for the Wisdom Engine.
class WisdomMapper {
  const WisdomMapper();

  /// Maps Drift Quote row to Domain QuoteEntity.
  QuoteEntity toQuoteEntity(Quote row) {
    return QuoteEntity(
      id: row.id,
      text: row.quoteText,
      figureId: row.figureId,
      sourceId: row.sourceId,
      languageCode: row.languageCode,
      trustStatus: row.trustStatus,
      attributionConfidence: row.attributionConfidence,
      tone: row.tone,
      usageFrequencyCap: row.usageFrequencyCap,
      sensitivityNotes: row.sensitivityNotes,
      isActive: row.isActive,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  /// Maps a list of Drift Quote rows to Domain QuoteEntities.
  List<QuoteEntity> toQuoteEntityList(List<Quote> rows) {
    return rows.map(toQuoteEntity).toList();
  }

  /// Maps Drift HistoricalFigure row to Domain HistoricalFigureEntity.
  HistoricalFigureEntity toFigureEntity(HistoricalFigure row) {
    return HistoricalFigureEntity(
      id: row.id,
      name: row.name,
      era: row.era,
      shortBio: row.shortBio,
      imageUrl: row.imageUrl,
      isActive: row.isActive,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  /// Maps Domain WisdomDecision to Drift Companion for inserting log.
  DecisionLogsCompanion toDecisionLogCompanion(WisdomDecision domain) {
    return DecisionLogsCompanion.insert(
      id: '${domain.selectedQuoteId ?? 'fallback'}_${domain.decisionTimestamp.millisecondsSinceEpoch}',
      userId: 'local_user', // TODO: inject user ID
      planId: 'plan_placeholder', // TODO: context doesn't keep plan ID here, we may need to pass it
      selectedQuoteId: drift.Value(domain.selectedQuoteId),
      candidatePoolSize: drift.Value(domain.topRejectedCandidates.length + (domain.selectedQuoteId != null ? 1 : 0)),
      fallbackTier: drift.Value(domain.fallbackTier.tierNumber),
      finalScore: drift.Value(domain.finalScore),
      userFacingExplanation: drift.Value(domain.userFacingExplanation),
      debugExplanation: drift.Value(domain.debugExplanation),
      createdAt: domain.decisionTimestamp,
    );
  }
}
