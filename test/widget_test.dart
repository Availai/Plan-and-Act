import 'package:flutter_test/flutter_test.dart';
import 'package:planandact/main.dart';

void main() {
  testWidgets('App açılırken ana ekran render edilir', (WidgetTester tester) async {
    await tester.pumpWidget(const PlanAndActApp());
    await tester.pumpAndSettle();

    expect(find.text('Plan and Act'), findsOneWidget);
  });
}
