import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens//add_rooms_screen.dart';

Future<void> iAmOnTheAddRoomsScreen(WidgetTester tester) async {
  await tester.pumpWidget(AddRoomsScreen());
  await tester.pumpAndSettle(); // Wait for any animations to complete
  expect(find.text('ADD ROOMS'), findsOneWidget);
}
