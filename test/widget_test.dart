import 'package:flutter_test/flutter_test.dart';

import 'package:pert_4/main.dart';

void main() {
  testWidgets('Home -> Profile -> Detail -> back navigation flow', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // HomePage
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Student Profile App'), findsOneWidget);
    expect(find.text('Learning Navigation in Flutter'), findsOneWidget);

    // Navigator.push -> ProfilePage
    await tester.tap(find.text('Open Profile'));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Yuni Kulsum'), findsOneWidget);
    expect(find.text('Student ID (NIM): 123456789'), findsOneWidget);

    // Navigator.push -> DetailPage
    await tester.tap(find.text('Open Detail'));
    await tester.pumpAndSettle();
    expect(find.text('Detail'), findsOneWidget);
    expect(find.text('Informatics'), findsOneWidget);
    expect(find.text('yuni@itb.ac.id'), findsOneWidget);
    expect(find.text('I am a student interested in mobile app development.'), findsOneWidget);

    // Navigator.pop -> ProfilePage
    await tester.tap(find.text('Back to Profile'));
    await tester.pumpAndSettle();
    expect(find.text('Open Detail'), findsOneWidget);
    expect(find.text('Detail'), findsNothing);

    // Navigator.pop -> HomePage
    await tester.tap(find.text('Back to Home'));
    await tester.pumpAndSettle();
    expect(find.text('Open Profile'), findsOneWidget);
    expect(find.text('Profile'), findsNothing);
  });
}
