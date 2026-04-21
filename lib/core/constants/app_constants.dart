/// Application-wide constants.
class AppConstants {
  AppConstants._();

  /// Local SQLite database file name.
  static const String databaseName = 'planandact.db';

  /// Default locale for quote selection.
  static const String defaultLocale = 'tr';

  /// Maximum number of recently shown quotes to track for diversity.
  static const int recentQuoteWindowSize = 20;

  /// Maximum number of recently shown figures to track for diversity.
  static const int recentFigureWindowSize = 10;

  /// Cooldown period (in hours) before the same quote can be reshown.
  static const int quoteCooldownHours = 72;

  /// Default postpone reschedule offset in days.
  static const int postponeOffsetDays = 1;

  /// Max plan title length for UI.
  static const int maxPlanTitleLength = 120;

  /// Max quote text length for UI card rendering.
  static const int maxQuoteDisplayLength = 280;
}
