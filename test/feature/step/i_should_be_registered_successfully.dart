import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens/AdminRegisterScreen.dart';

Future<void> iShouldBeRegisteredSuccessfully(WidgetTester tester) async {
  // Wait for the registration process to complete
  await tester.pumpAndSettle();

  // Check if the registration was successful
  expect(find.text('Registration Successful'), findsOneWidget);
}
