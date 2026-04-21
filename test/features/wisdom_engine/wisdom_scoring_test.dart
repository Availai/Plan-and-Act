import 'package:flutter_test/flutter_test.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_priority.dart';
import 'package:planandact/features/wisdom_engine/application/services/wisdom_scoring_engine.dart';
import 'package:planandact/features/wisdom_engine/domain/entities/quote_entity.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/wisdom_context.dart';

void main() {
  group('WisdomScoringEngine Tests', () {
    final engine = WisdomScoringEngine();

    final baseQuote = QuoteEntity(
      id: 'q1',
      text: 'Test quote',
      figureId: 'fig1',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      tone: 'direct',
      isActive: true,
      trustStatus: 'verified',
      usageFrequencyCap: 5,
      languageCode: 'tr',
      attributionConfidence: 1.0,
    );

    final baseContext = WisdomContext(
      planId: 'p1',
      userId: 'u1',
      title: 'Plan Title',
      scheduledAt: DateTime.now().add(const Duration(hours: 2)), // "upcoming"
      timeOfDaySegment: 'afternoon',
      priority: PlanPriority.high, // Effort -> high
    );

    test('Hard filter removes language mismatch', () {
      final quote = baseQuote.copyWith(languageCode: 'en');
      final ranked = engine.rankCandidates([quote], baseContext, {'q1': ['execution']});

      expect(ranked.first.rejectionReason, 'Language mismatch');
      expect(ranked.first.totalScore, 0.0);
    });

    test('Hard filter removes recently shown quote (cooldown)', () {
      final ctx = baseContext.copyWith(recentQuoteIds: ['q1']);
      final ranked = engine.rankCandidates([baseQuote], ctx, {'q1': ['execution']});

      expect(ranked.first.rejectionReason, 'Recently shown (Cooldown)');
    });

    test('Scores category match heavily', () {
      final quote1 = baseQuote.copyWith(id: 'q1', text: 'Math match');
      final quote2 = baseQuote.copyWith(id: 'q2', text: 'No match');

      final ctx = baseContext.copyWith(recentSemanticBuckets: ['study']);

      final tags = {
        'q1': ['study', 'deepFocus'], // Matches
        'q2': ['health', 'exercise'], // Doesn't match
      };

      final ranked = engine.rankCandidates([quote1, quote2], ctx, tags);

      // q1 must win because category match has the highest weight (2.0)
      expect(ranked.first.quote.id, 'q1');
      expect(ranked.first.breakdown.categoryMatch, 1.0);
      expect(ranked.last.breakdown.categoryMatch, 0.0);
    });

    test('Applies high penalty for repeating figure', () {
      final quote1 = baseQuote.copyWith(id: 'q1', figureId: 'fig_ataturk');
      final quote2 = baseQuote.copyWith(id: 'q2', figureId: 'fig_seneca');

      // Both matches same category to isolate figure penalty
      final ctx = baseContext.copyWith(
        recentSemanticBuckets: ['execution'],
        recentFigureIds: ['fig_ataturk'], // Atatürk was shown recently
      );

      final tags = {
        'q1': ['execution'],
        'q2': ['execution'],
      };

      final ranked = engine.rankCandidates([quote1, quote2], ctx, tags);

      // quote2 (Seneca) should rank higher due to the diversity penalty on Atatürk
      expect(ranked.first.quote.id, 'q2');
      expect(ranked.last.quote.id, 'q1');
      
      // Let's verify breakdown
      expect(ranked.last.breakdown.diversityPenalty, 0.8);
      expect(ranked.first.breakdown.diversityPenalty, 0.0);
    });
  });
}
