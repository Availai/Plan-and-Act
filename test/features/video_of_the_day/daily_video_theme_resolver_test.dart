import 'package:flutter_test/flutter_test.dart';
import 'package:planandact/features/video_of_the_day/application/services/daily_video_theme_resolver.dart';

void main() {
  group('DailyVideoThemeResolver', () {
    const resolver = DailyVideoThemeResolver();

    test('maps weekdays deterministically to supported themes', () {
      expect(resolver.resolveForDate(DateTime.utc(2026, 4, 20)), 'focus'); // Monday
      expect(resolver.resolveForDate(DateTime.utc(2026, 4, 21)), 'discipline'); // Tuesday
      expect(resolver.resolveForDate(DateTime.utc(2026, 4, 22)), 'action'); // Wednesday
      expect(resolver.resolveForDate(DateTime.utc(2026, 4, 23)), 'resilience'); // Thursday
      expect(resolver.resolveForDate(DateTime.utc(2026, 4, 24)), 'learning'); // Friday
      expect(resolver.resolveForDate(DateTime.utc(2026, 4, 25)), 'leadership'); // Saturday
      expect(resolver.resolveForDate(DateTime.utc(2026, 4, 26)), 'consistency'); // Sunday
    });
  });
}
