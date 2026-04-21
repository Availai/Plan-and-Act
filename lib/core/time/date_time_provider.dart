/// Abstraction over `DateTime.now()` for testability.
///
/// In production code, use [SystemDateTimeProvider].
/// In tests, inject a fixed-time variant.
abstract class DateTimeProvider {
  DateTime now();
  DateTime today() {
    final n = now();
    return DateTime(n.year, n.month, n.day);
  }
}

class SystemDateTimeProvider extends DateTimeProvider {
  @override
  DateTime now() => DateTime.now();
}

