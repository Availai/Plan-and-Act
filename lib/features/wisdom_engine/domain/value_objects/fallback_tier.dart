/// Fallback tiers for when no strong match exists.
enum FallbackTier {
  /// Exact semantic category match found.
  exactMatch,

  /// Close but not exact category match.
  closeMatch,

  /// Generic execution/action quote.
  genericExecution,

  /// Safe motivational fallback.
  safeFallback,

  /// Neutral encouragement card with no specific quote.
  neutralEncouragement;

  int get tierNumber => index + 1;
}
