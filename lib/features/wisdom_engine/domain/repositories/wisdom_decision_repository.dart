import 'package:planandact/features/wisdom_engine/domain/entities/wisdom_decision.dart';

/// Repository contract for wisdom engine decision logging.
abstract class WisdomDecisionRepository {
  /// Persists a decision log entry.
  Future<void> logDecision(WisdomDecision decision);

  /// Returns recent decisions for a user (for analytics).
  Future<List<WisdomDecision>> getRecentDecisions(String userId, int limit);
}
