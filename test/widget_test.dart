import 'package:flutter_test/flutter_test.dart';
import 'package:navigation_app/main.dart';

void main() {
  testWidgets('Navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(const NavigationApp());

    // Home screen should appear first.
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Go to Profile'), findsOneWidget);

    // Go to Profile.
    await tester.tap(find.text('Go to Profile'));
    await tester.pumpAndSettle();

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('View Details'), findsOneWidget);

    // Go to Details.
    await tester.tap(find.text('View Details'));
    await tester.pumpAndSettle();

    expect(find.text('Details'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);

    // Go back to Profile.
    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Profile'), findsOneWidget);
  });
}
