import 'package:flutter_test/flutter_test.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_priority.dart';
import 'package:planandact/features/wisdom_engine/application/services/context_extractor.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/tone.dart';

void main() {
  group('ContextExtractor Tests', () {
    const extractor = ContextExtractor();
    
    final basePlan = PlanEntity(
      id: 'plan1',
      userId: 'u1',
      title: 'Matematik Test Çöz',
      scheduledDate: DateTime(2026, 4, 21, 14, 0), // 14:00 (Afternoon)
      scheduledTimeLocal: '14:00',
      scheduledAtUtc: DateTime(2026, 4, 21, 11, 0).toUtc(),
      createdAt: DateTime(2026, 4, 1),
      updatedAt: DateTime(2026, 4, 1),
      priority: PlanPriority.high,
      durationMinutes: 45,
    );

    test('Maps correct semantic buckets based on keywords', () {
      final context = extractor.extract(
        plan: basePlan.copyWith(
          title: 'Çok Zor Bir Ders Çalışma Seansı',
          description: 'Bugün odaklanıp çalışmalıyım',
        ),
        userId: 'u1',
        currentUserStreak: 5,
        completionRate7d: 0.9,
        postponementCount7d: 0,
        skipCount7d: 0,
        preferredTone: Tone.intense,
        recentQuoteIds: [],
        recentFigureIds: [],
      );

      // "odak" -> deepFocus, "çalış" -> work, "ders" -> study
      expect(context.recentSemanticBuckets, contains('study'));
      expect(context.recentSemanticBuckets, contains('work'));
      expect(context.recentSemanticBuckets, contains('deepFocus'));
    });

    test('Correctly identifies time of day', () {
      // Morning
      var context = extractor.extract(
        plan: basePlan.copyWith(scheduledDate: DateTime(2026, 4, 21, 8, 0)),
        userId: 'u1',
        currentUserStreak: 1,
        completionRate7d: 1.0,
        postponementCount7d: 0,
        skipCount7d: 0,
        preferredTone: Tone.direct,
        recentQuoteIds: [],
        recentFigureIds: [],
      );
      expect(context.timeOfDaySegment, 'morning');

      // Night
      context = extractor.extract(
        plan: basePlan.copyWith(scheduledDate: DateTime(2026, 4, 21, 23, 0)),
        userId: 'u1',
        currentUserStreak: 1,
        completionRate7d: 1.0,
        postponementCount7d: 0,
        skipCount7d: 0,
        preferredTone: Tone.direct,
        recentQuoteIds: [],
        recentFigureIds: [],
      );
      expect(context.timeOfDaySegment, 'night');
    });

    test('Applies fallback execution bucket if no keywords match', () {
      final context = extractor.extract(
        plan: basePlan.copyWith(
          title: 'Rastgele bir başlık',
          description: 'Bir şeyler yapılacak',
        ),
        userId: 'u1',
        currentUserStreak: 5,
        completionRate7d: 0.9,
        postponementCount7d: 0,
        skipCount7d: 0,
        preferredTone: Tone.intense,
        recentQuoteIds: [],
        recentFigureIds: [],
      );

      expect(context.recentSemanticBuckets, ['execution']);
    });
  });
}
