import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/planning/application/providers/database_provider.dart';
import 'package:planandact/features/wisdom_engine/application/services/context_extractor.dart';
import 'package:planandact/features/wisdom_engine/application/services/wisdom_scoring_engine.dart';
import 'package:planandact/features/wisdom_engine/application/use_cases/generate_wisdom_decision_use_case.dart';
import 'package:planandact/features/wisdom_engine/data/repositories/drift_wisdom_repository.dart';
import 'package:planandact/shared/data/local/daos/wisdom_dao.dart';

/// Provides the WisdomDao.
final wisdomDaoProvider = Provider<WisdomDao>((ref) {
  final db = ref.watch(databaseProvider);
  return WisdomDao(db);
});

/// Provides the DriftWisdomRepository.
final wisdomRepositoryProvider = Provider<DriftWisdomRepository>((ref) {
  final dao = ref.watch(wisdomDaoProvider);
  return DriftWisdomRepository(dao: dao);
});

/// Provides the ContextExtractor.
final contextExtractorProvider = Provider<ContextExtractor>((ref) {
  return const ContextExtractor();
});

/// Provides the Scoring Engine.
final wisdomScoringEngineProvider = Provider<WisdomScoringEngine>((ref) {
  return WisdomScoringEngine();
});

/// Provides the orchestration Use Case for generating motivational decisions.
final generateWisdomDecisionProvider = Provider<GenerateWisdomDecisionUseCase>((ref) {
  final repo = ref.watch(wisdomRepositoryProvider);
  final dao = ref.watch(wisdomDaoProvider);
  final extractor = ref.watch(contextExtractorProvider);
  final engine = ref.watch(wisdomScoringEngineProvider);

  return GenerateWisdomDecisionUseCase(
    contextExtractor: extractor,
    scoringEngine: engine,
    quoteRepo: repo,
    usageRepo: repo,
    decisionRepo: repo,
    dao: dao,
  );
});
