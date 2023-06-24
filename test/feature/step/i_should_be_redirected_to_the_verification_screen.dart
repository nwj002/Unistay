// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iShouldBeRedirectedToTheVerificationScreen(WidgetTester tester) async {
//   throw UnimplementedError();
// }


import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens/RegisterScreen.dart';
import 'package:unistay/screens/verify_screen.dart';

Future<void> iShouldBeRedirectedToTheVerificationScreen(WidgetTester tester) async {
  // Wait for the widgets to settle
  await tester.pumpAndSettle();

  // Verify that we are on the verification screen
  expect(find.byType(Verify), findsOneWidget);
}
