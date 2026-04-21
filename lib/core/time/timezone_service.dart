import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Initializes timezone data and provides conversion helpers.
class TimezoneService {
  TimezoneService._();

  static bool _initialized = false;

  /// Must be called once at app startup (in main).
  static void initialize() {
    if (_initialized) return;
    tz.initializeTimeZones();
    _initialized = true;
  }

  /// Returns the device-local timezone location.
  static tz.Location get local => tz.local;

  /// Converts a local DateTime to UTC tz-aware TZDateTime.
  static tz.TZDateTime toTZDateTime(DateTime dateTime, String timezoneName) {
    final location = tz.getLocation(timezoneName);
    return tz.TZDateTime.from(dateTime, location);
  }
}
