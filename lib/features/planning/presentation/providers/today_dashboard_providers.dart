import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/planning/application/providers/plan_repository_provider.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/video_of_the_day/application/providers/video_providers.dart';
import 'package:planandact/features/video_of_the_day/domain/entities/video_entity.dart';
import 'package:planandact/features/wisdom_engine/application/providers/wisdom_providers.dart';
import 'package:planandact/features/wisdom_engine/domain/entities/wisdom_decision.dart';
import 'package:planandact/features/wisdom_engine/domain/value_objects/tone.dart';

DateTime _normalizeDate(DateTime date) => DateTime(date.year, date.month, date.day);

/// The date currently selected on the dashboard calendar strip.
final selectedDashboardDateProvider = StateProvider.autoDispose<DateTime>((ref) {
  return _normalizeDate(DateTime.now());
});

/// Plan list bound to selected dashboard date.
final selectedDatePlansProvider = StreamProvider.autoDispose<List<PlanEntity>>((ref) {
  const userId = 'local_user';
  final date = ref.watch(selectedDashboardDateProvider);
  final repo = ref.watch(planRepositoryProvider);
  return repo.watchPlansForDate(userId, date);
});

/// Exposes the daily video for selected date.
final currentDailyVideoProvider = FutureProvider.autoDispose<VideoEntity?>((ref) async {
  final useCase = ref.watch(fetchDailyVideoUseCaseProvider);
  final selectedDate = ref.watch(selectedDashboardDateProvider);
  return useCase.call(selectedDate);
});

/// Finds the most relevant upcoming actionable plan for today.
final nextActionablePlanProvider = Provider.autoDispose<PlanEntity?>((ref) {
  final plansAsync = ref.watch(selectedDatePlansProvider);
  
  if (!plansAsync.hasValue) return null;
  
  final plans = plansAsync.value!;
  final actionable = plans.where((p) => p.status.isActionable).toList();
  
  if (actionable.isEmpty) return null;

  // Sort by time
  actionable.sort((a, b) => a.scheduledAtUtc.compareTo(b.scheduledAtUtc));
  return actionable.first;
});

/// Generates wisdom message for the next actionable plan.
final currentWisdomDecisionProvider = FutureProvider.autoDispose<WisdomDecision?>((ref) async {
  final nextPlan = ref.watch(nextActionablePlanProvider);
  if (nextPlan == null) return null;

  final useCase = ref.watch(generateWisdomDecisionProvider);
  
  // Call use case with defaults since we don't have user metrics fully hooked to UI yet
  return useCase.call(
    plan: nextPlan,
    userId: 'local_user',
    currentUserStreak: 1, // Mock
    completionRate7d: 1.0, // Mock
    postponementCount7d: 0, // Mock
    skipCount7d: 0, // Mock
    preferredTone: Tone.direct,
  );
});
