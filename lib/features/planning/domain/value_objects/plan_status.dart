/// Plan status values.
///
/// Stored as strings in Drift ('planned', 'completed', etc.).
/// The `overdue` concept is derived, not a separate status.
enum PlanStatus {
  planned,
  completed,
  skipped,
  postponed,
  canceled;

  /// Whether this status represents a terminal state.
  bool get isTerminal =>
      this == completed || this == canceled;

  /// Whether this plan is still actionable.
  bool get isActionable =>
      this == planned || this == postponed;
}
