/// Plan priority levels.
///
/// Stored as strings in Drift ('low', 'medium', etc.).
enum PlanPriority {
  low,
  medium,
  high,
  critical;

  /// Numeric weight for sorting (higher = more important).
  int get weight => switch (this) {
        low => 1,
        medium => 2,
        high => 3,
        critical => 4,
      };
}
