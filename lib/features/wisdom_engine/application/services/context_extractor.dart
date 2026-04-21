import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/semantic_bucket.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/tone.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/wisdom_context.dart';

/// Preprocessing pipeline mapping raw `PlanEntity` and domain data into a `WisdomContext`.
class ContextExtractor {
  const ContextExtractor();

  /// Internal deterministic synonym mapping to buckets.
  /// (In a real app, this might be loaded from DB `WisdomKeywordMap`, 
  /// but local memory dictionary is extremely fast and deterministic).
  static const Map<String, SemanticBucket> _keywordMap = {
    'ders': SemanticBucket.study,
    'çalış': SemanticBucket.work,
    'odak': SemanticBucket.deepFocus,
    'deep work': SemanticBucket.deepFocus,
    'spor': SemanticBucket.exercise,
    'koşu': SemanticBucket.exercise,
    'sağlık': SemanticBucket.health,
    'diyet': SemanticBucket.health,
    'dayan': SemanticBucket.resilience,
    'pes etme': SemanticBucket.resilience,
    'lider': SemanticBucket.leadership,
    'tasarım': SemanticBucket.creativity,
    'yazı': SemanticBucket.creativity,
    'dinlen': SemanticBucket.recovery,
    'rutin': SemanticBucket.consistency,
    'plan': SemanticBucket.planning,
    'ertelediğim': SemanticBucket.procrastination,
    'başarısız': SemanticBucket.failure,
    'yeniden': SemanticBucket.restart,
  };

  /// Main extraction method.
  WisdomContext extract({
    required PlanEntity plan,
    required String userId,
    required int currentUserStreak,
    required double completionRate7d,
    required int postponementCount7d,
    required int skipCount7d,
    required Tone preferredTone,
    required List<String> recentQuoteIds,
    required List<String> recentFigureIds,
  }) {
    // Time of day segment calculation (Local to the device)
    // Morning (05:00 - 11:59), Afternoon (12:00 - 17:59), Night (18:00 - 04:59)
    final hour = plan.scheduledDate.hour;
    String timeOfDay;
    if (hour >= 5 && hour < 12) {
      timeOfDay = 'morning';
    } else if (hour >= 12 && hour < 18) {
      timeOfDay = 'afternoon';
    } else {
      timeOfDay = 'night';
    }

    // Keyword mapping
    final buckets = _extractBuckets('${plan.title} ${plan.description}'.toLowerCase());

    return WisdomContext(
      planId: plan.id,
      userId: userId,
      title: plan.title,
      description: plan.description,
      scheduledAt: plan.scheduledAtUtc,
      durationMinutes: plan.durationMinutes,
      categorySlug: plan.categoryId, // E.g., 'cat_deep_work'
      priority: plan.priority,
      currentStatus: plan.status,
      currentStreak: currentUserStreak,
      recentCompletionRate7d: completionRate7d,
      recentPostponementCount7d: postponementCount7d,
      recentSkipCount7d: skipCount7d,
      timeOfDaySegment: timeOfDay,
      preferredTone: preferredTone,
      recentQuoteIds: recentQuoteIds,
      recentFigureIds: recentFigureIds,
      recentSemanticBuckets: buckets.map((b) => b.name).toList(),
      locale: 'tr',
      timezone: plan.scheduledTimezone,
    );
  }

  /// Extracts buckets by checking the input text against the dictionary.
  List<SemanticBucket> _extractBuckets(String normalizedText) {
    final Set<SemanticBucket> matched = {};

    _keywordMap.forEach((keyword, bucket) {
      if (normalizedText.contains(keyword)) {
        matched.add(bucket);
      }
    });

    // Fallback if empty
    if (matched.isEmpty) {
      matched.add(SemanticBucket.execution);
    }

    return matched.toList();
  }
}
