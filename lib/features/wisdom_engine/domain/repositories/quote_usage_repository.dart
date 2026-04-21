/// Repository contract for tracking quote usage history.
abstract class QuoteUsageRepository {
  /// Records that a quote was shown.
  Future<void> recordUsage({
    required String userId,
    required String quoteId,
    String? planId,
  });

  /// Returns IDs of recently shown quotes (within window).
  Future<List<String>> getRecentQuoteIds(String userId, int windowSize);

  /// Returns IDs of recently shown figures.
  Future<List<String>> getRecentFigureIds(String userId, int windowSize);

  /// Counts how many times a quote was shown to a user.
  Future<int> getUsageCount(String userId, String quoteId);
}
