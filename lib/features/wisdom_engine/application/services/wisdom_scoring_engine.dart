import 'dart:math' as math;
import 'package:planandact/features/planning/domain/value_objects/plan_priority.dart';
import 'package:planandact/features/wisdom_engine/domain/entities/quote_entity.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/score_breakdown.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/wisdom_context.dart';

/// Scored candidate container.
class ScoredQuote {
  const ScoredQuote({
    required this.quote,
    required this.totalScore,
    required this.breakdown,
    this.rejectionReason,
  });

  final QuoteEntity quote;
  final double totalScore;
  final ScoreBreakdown breakdown;
  final String? rejectionReason;
}

/// Core deterministic Wisdom Scoring Engine.
class WisdomScoringEngine {
  /// Evaluates all candidates and returns them sorted by score (highest first).
  List<ScoredQuote> rankCandidates(
    List<QuoteEntity> candidates,
    WisdomContext context,
    // Provide tag mapping to avoid db calls during the tight loop.
    Map<String, List<String>> quoteToTags, // quoteId -> list of tagSlugs
  ) {
    final results = <ScoredQuote>[];

    for (var quote in candidates) {
      // 1. Hard Filters
      final rejectedReason = _evaluateHardFilters(quote, context);
      if (rejectedReason != null) {
        results.add(ScoredQuote(
          quote: quote,
          totalScore: 0.0,
          breakdown: const ScoreBreakdown(),
          rejectionReason: rejectedReason,
        ));
        continue;
      }

      // 2. Soft Scoring
      final tags = quoteToTags[quote.id] ?? [];
      final breakdown = _calculateScoreBreakdown(quote, tags, context);
      
      // Compute final score via weighted sum. (Weights can be DB-driven in future)
      final totalScore = 
          (breakdown.categoryMatch * 2.0) +
          (breakdown.urgency * 1.2) +
          (breakdown.effortProfile * 1.5) +
          (breakdown.behaviorState * 1.5) +
          (breakdown.streak * 1.2) +
          (breakdown.toneAlignment * 1.0) +
          (breakdown.timeOfDay * 0.8) +
          (breakdown.qualityBonus * 1.0) -
          (breakdown.diversityPenalty * 3.0); // Penalty is subtracted heavily

      results.add(ScoredQuote(
        quote: quote,
        totalScore: math.max(0.0, totalScore), // Floor at 0
        breakdown: breakdown,
      ));
    }

    // Sort descending
    results.sort((a, b) => b.totalScore.compareTo(a.totalScore));
    return results;
  }

  /// Returns a reason if the quote should be discarded, null otherwise.
  String? _evaluateHardFilters(QuoteEntity quote, WisdomContext context) {
    if (!quote.isActive) return 'Inactive quote';
    if (quote.languageCode != context.locale) return 'Language mismatch';
    
    // Cooldown filter: if it was shown recently and it reached its cap. 
    // In our simplified model here, we just reject if it is precisely one of the recent ones.
    if (context.recentQuoteIds.contains(quote.id)) {
      return 'Recently shown (Cooldown)';
    }

    // Avoid insensitive quotes if user is struggling.
    if (context.behaviorState == 'struggling' && quote.tone == 'intense') {
      return 'Tone too intense for struggling user';
    }

    return null;
  }

  /// Calculates individual dimensions 0.0 - 1.0.
  ScoreBreakdown _calculateScoreBreakdown(
      QuoteEntity quote, List<String> quoteTags, WisdomContext context) {
    
    // Category match
    double catMatch = 0.0;
    for (var bucket in context.recentSemanticBuckets) {
      if (quoteTags.contains(bucket)) {
        catMatch = 1.0;
        break; // Exact match on at least one semantics
      }
    }

    // Urgency
    double urgencyScore = 0.0;
    if (context.urgencyBand == 'overdue' || context.urgencyBand == 'imminent') {
      if (quoteTags.contains('execution') || quoteTags.contains('discipline')) {
        urgencyScore = 1.0;
      }
    }

    // Effort Profile
    double effortScore = 0.0;
    if (context.taskSize == 'large' || context.priority == PlanPriority.high || context.priority == PlanPriority.critical) {
      if (quoteTags.contains('resilience') || quoteTags.contains('deepFocus')) {
        effortScore = 1.0;
      }
    }

    // Behavior State
    double behaviorScore = 0.0;
    if (context.behaviorState == 'struggling') {
      if (quoteTags.contains('recovery') || quoteTags.contains('restart')) {
        behaviorScore = 1.0;
      }
    } else if (context.behaviorState == 'thriving') {
      if (quoteTags.contains('consistency') || quoteTags.contains('leadership')) {
        behaviorScore = 1.0;
      }
    }

    // Streak
    double streakScore = 0.0;
    if (context.currentStreak >= 3 && quoteTags.contains('consistency')) {
      streakScore = 1.0;
    }

    // Tone Alignment
    double toneScore = (quote.tone == context.preferredTone.name) ? 1.0 : 0.5;

    // Time of Day
    double timeOfDayScore = 0.0;
    if (context.timeOfDaySegment == 'morning' && quoteTags.contains('planning')) {
      timeOfDayScore = 0.8;
    } else if (context.timeOfDaySegment == 'night' && quoteTags.contains('recovery')) {
      timeOfDayScore = 0.8;
    }

    // Quality Bonus (based on existing attribution confidence)
    double qualityBonus = quote.attributionConfidence;

    // Diversity Penalty
    double diversityPenalty = 0.0;
    if (context.recentFigureIds.contains(quote.figureId)) {
      diversityPenalty = 0.8; // High penalty for repeating author
    }

    return ScoreBreakdown(
      categoryMatch: catMatch,
      urgency: urgencyScore,
      effortProfile: effortScore,
      behaviorState: behaviorScore,
      streak: streakScore,
      toneAlignment: toneScore,
      timeOfDay: timeOfDayScore,
      qualityBonus: qualityBonus,
      diversityPenalty: diversityPenalty,
    );
  }
}
