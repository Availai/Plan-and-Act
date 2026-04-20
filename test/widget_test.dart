import 'package:flutter_test/flutter_test.dart';
import 'package:planandact/features/plan_management/home_screen.dart';
import 'package:planandact/main.dart';

void main() {
  testWidgets('Uygulama açılınca HomeScreen yüklenir', (WidgetTester tester) async {
    await tester.pumpWidget(const PlanAndActApp());
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('Yeni Plan butonu görünür', (WidgetTester tester) async {
    await tester.pumpWidget(const PlanAndActApp());
    await tester.pumpAndSettle();

    expect(find.text('Yeni Plan'), findsOneWidget);
  });

  testWidgets('Plan yokken empty-state metni gösterilir', (WidgetTester tester) async {
    await tester.pumpWidget(const PlanAndActApp());
    await tester.pumpAndSettle();

    expect(find.text('Harika bir başlangıç için ilk planını ekle ✨'), findsOneWidget);
    expect(
      find.text('“Yeni Plan” butonuna dokun ve bugününü organize etmeye başla.'),
      findsOneWidget,
    );
  });
}
