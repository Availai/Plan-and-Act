import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/wisdom_engine/application/services/context_extractor.dart';
import 'package:planandact/features/wisdom_engine/application/services/wisdom_scoring_engine.dart';
import 'package:planandact/features/wisdom_engine/domain/entities/wisdom_decision.dart';
import 'package:planandact/features/wisdom_engine/domain/repositories/quote_repository.dart';
import 'package:planandact/features/wisdom_engine/domain/repositories/quote_usage_repository.dart';
import 'package:planandact/features/wisdom_engine/domain/repositories/wisdom_decision_repository.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/fallback_tier.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/tone.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/wisdom_context.dart';
import 'package:planandact/shared/data/local/daos/wisdom_dao.dart';

/// Orchestrates the process of generating a motivational message.
class GenerateWisdomDecisionUseCase {
  const GenerateWisdomDecisionUseCase({
    required this.contextExtractor,
    required this.scoringEngine,
    required this.quoteRepo,
    required this.usageRepo,
    required this.decisionRepo,
    required this.dao, // required to fetch tags mapping efficiently
  });

  final ContextExtractor contextExtractor;
  final WisdomScoringEngine scoringEngine;
  final QuoteRepository quoteRepo;
  final QuoteUsageRepository usageRepo;
  final WisdomDecisionRepository decisionRepo;
  final WisdomDao dao;

  Future<WisdomDecision> call({
    required PlanEntity plan,
    required String userId,
    required int currentUserStreak,
    required double completionRate7d,
    required int postponementCount7d,
    required int skipCount7d,
    required Tone preferredTone,
  }) async {
    // 1. Fetch recent usage for context
    final recentQuoteIds = await usageRepo.getRecentQuoteIds(userId, 20);
    final recentFigureIds = await usageRepo.getRecentFigureIds(userId, 10);

    // 2. Extract Context
    final context = contextExtractor.extract(
      plan: plan,
      userId: userId,
      currentUserStreak: currentUserStreak,
      completionRate7d: completionRate7d,
      postponementCount7d: postponementCount7d,
      skipCount7d: skipCount7d,
      preferredTone: preferredTone,
      recentQuoteIds: recentQuoteIds,
      recentFigureIds: recentFigureIds,
    );

    // 3. Fetch Candidate Pool
    // For v1, we grab all active quotes (if pool is small) or we could filter by tag here.
    // Given the local drift nature, fetching all active quotes is very fast for <1000 items.
    final candidatePool = await quoteRepo.getActiveQuotes(languageCode: 'tr', limit: 500);

    // Provide tag mapping
    final Map<String, List<String>> quoteToTags = {};
    // Simplified tag mapping workaround: In phase 3 we just use a basic mapping,
    // assuming the dao has a method to get tags.
    // For now we will pass empty, and let the scoring engine fall back to default logic.
    // (A true implementation would do: SELECT t.slug, l.quoteId FROM tags t JOIN links l).

    // 4. Rank Candidates
    final ranked = scoringEngine.rankCandidates(candidatePool, context, quoteToTags);

    // 5. Select Best and Apply Fallbacks
    WisdomDecision decision;

    if (ranked.isEmpty) {
      decision = _buildFallback(context, FallbackTier.neutralEncouragement);
    } else {
      final best = ranked.first;

      if (best.totalScore > 1.5) {
        // In local db, fetch the figure name
        final f = await dao.getHistoricalFigureById(best.quote.figureId);

        decision = WisdomDecision(
          selectedQuoteId: best.quote.id,
          selectedQuoteText: best.quote.text,
          historicalFigureName: f?.name ?? 'Anonim',
          sourceReference: best.quote.sourceId, // Can resolve source name too
          selectedCategories: context.recentSemanticBuckets,
          fallbackTier: FallbackTier.exactMatch,
          finalScore: best.totalScore,
          scoreBreakdown: best.breakdown,
          topRejectedCandidates: ranked
              .skip(1)
              .take(3)
              .map((c) => RejectedCandidate(
                    quoteId: c.quote.id,
                    score: c.totalScore,
                    rejectionReason: c.rejectionReason ?? 'Lower score',
                  ))
              .toList(),
          userFacingExplanation:
              'Bu mesaj, planınızın zorluk seviyesi ve zamanlamasına göre seçildi.',
          debugExplanation: 'Score: ${best.totalScore}',
          decisionTimestamp: DateTime.now(),
        );

        // Record usage
        await usageRepo.recordUsage(
          userId: userId,
          quoteId: best.quote.id,
          planId: plan.id,
        );
      } else {
        // Fallback tier
        decision = _buildFallback(context, FallbackTier.safeFallback);
      }
    }

    // 6. Log Decision
    await decisionRepo.logDecision(decision);

    return decision;
  }

  WisdomDecision _buildFallback(WisdomContext context, FallbackTier tier) {
    return WisdomDecision(
      fallbackTier: tier,
      selectedCategories: context.recentSemanticBuckets,
      decisionTimestamp: DateTime.now(),
      userFacingExplanation: 'Bu görev için özel bir teşvik kartı oluşturuldu.',
    );
  }
}
