/// Deterministic resolver that maps each weekday to a single theme.
///
/// This gives stable behavior across devices and keeps analytics explainable.
class DailyVideoThemeResolver {
  const DailyVideoThemeResolver();

  /// Returns one of the allowed themes:
  /// focus, discipline, action, resilience, learning, leadership, consistency.
  String resolveForDate(DateTime date) {
    final weekday = date.toUtc().weekday;
    switch (weekday) {
      case DateTime.monday:
        return 'focus';
      case DateTime.tuesday:
        return 'discipline';
      case DateTime.wednesday:
        return 'action';
      case DateTime.thursday:
        return 'resilience';
      case DateTime.friday:
        return 'learning';
      case DateTime.saturday:
        return 'leadership';
      case DateTime.sunday:
        return 'consistency';
      default:
        return 'focus';
    }
  }
}
