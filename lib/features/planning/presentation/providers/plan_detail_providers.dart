import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/application/providers/database_provider.dart';
import 'package:planandact/features/planning/application/providers/plan_repository_provider.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_task_type.dart';

class PlanQuoteInsight {
  const PlanQuoteInsight({
    required this.quoteText,
    required this.figureName,
    required this.taskType,
  });

  final String quoteText;
  final String figureName;
  final PlanTaskType taskType;
}

final planByIdProvider =
    FutureProvider.autoDispose.family<PlanEntity, String>((ref, planId) async {
  final repository = ref.watch(planRepositoryProvider);
  final result = await repository.getPlanById(planId);

  switch (result) {
    case Success(:final value):
      return value;
    case Err(:final failure):
      throw Exception(failure.message);
  }
});

final planQuoteInsightProvider =
    FutureProvider.autoDispose.family<PlanQuoteInsight?, PlanEntity>((
  ref,
  plan,
) async {
  final db = ref.watch(databaseProvider);
  final type = _detectTaskType(plan);

  final quotes = await db.wisdomDao.getQuotesByTagSlugs([type.tagSlug]);
  if (quotes.isEmpty) return null;

  quotes.sort((a, b) => a.id.compareTo(b.id));
  final stableSeed = plan.id.codeUnits.fold<int>(0, (acc, c) => acc + c);
  final selected = quotes[stableSeed % quotes.length];
  final figure = await db.wisdomDao.getHistoricalFigureById(selected.figureId);

  return PlanQuoteInsight(
    quoteText: selected.quoteText,
    figureName: figure?.name ?? 'Bilinmeyen Kaynak',
    taskType: type,
  );
});

PlanTaskType _detectTaskType(PlanEntity plan) {
  final snapshot = plan.motivationContextSnapshot ?? '';
  if (snapshot.startsWith('task_type:')) {
    final key = snapshot.replaceFirst('task_type:', '');
    return parsePlanTaskTypeKey(key);
  }

  final text = '${plan.title} ${plan.description}'.toLowerCase();

  const sporKeywords = [
    'spor',
    'antrenman',
    'fitness',
    'kosu',
    'yuzme',
    'gym',
    'workout',
    'egzersiz',
  ];
  const programmingKeywords = [
    'code',
    'coding',
    'program',
    'bug',
    'flutter',
    'dart',
    'yazilim',
    'algoritma',
    'api',
    'refactor',
  ];
  const socialKeywords = [
    'sosyal',
    'arkadas',
    'network',
    'topluluk',
    'aile',
    'bulusma',
    'iletisim',
    'sunum',
    'gorusme',
  ];
  const researchKeywords = [
    'arastirma',
    'research',
    'makale',
    'paper',
    'inceleme',
    'analiz',
    'literatur',
    'tez',
    'hipotez',
  ];

  bool hasAny(List<String> words) => words.any(text.contains);

  if (hasAny(sporKeywords)) return PlanTaskType.spor;
  if (hasAny(programmingKeywords)) return PlanTaskType.programming;
  if (hasAny(socialKeywords)) return PlanTaskType.sosyallesme;
  if (hasAny(researchKeywords)) return PlanTaskType.arastirma;

  return PlanTaskType.programming;
}
