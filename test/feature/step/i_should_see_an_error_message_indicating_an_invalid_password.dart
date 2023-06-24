// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iShouldSeeAnErrorMessageIndicatingAnInvalidPassword(WidgetTester tester) async {
//   throw UnimplementedError();
// }


import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens/RegisterScreen.dart';

Future<void> iShouldSeeAnErrorMessageIndicatingAnInvalidPassword(WidgetTester tester) async {
  // Wait for the widgets to settle
  await tester.pumpAndSettle();

  // Find the error message widget
  final errorMessageFinder = find.text('Invalid password');

  // Verify that the error message widget is present
  expect(errorMessageFinder, findsOneWidget);
}
