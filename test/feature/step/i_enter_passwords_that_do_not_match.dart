import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens/AdminRegisterScreen.dart';

Future<void> iEnterPasswordsThatDoNotMatch(WidgetTester tester) async {
  // Find the password text field
  final passwordTextFieldFinder = find.byKey(Key('password_text_field'));

  // Find the confirm password text field
  final confirmPasswordTextFieldFinder = find.byKey(Key('confirm_password_text_field'));

  // Enter a password
  await tester.enterText(passwordTextFieldFinder, 'password123');

  // Enter a different password for confirm password
  await tester.enterText(confirmPasswordTextFieldFinder, 'different_password');

  // Dismiss the keyboard
  await tester.testTextInput.receiveAction(TextInputAction.done);

  // Wait for the widget to rebuild
  await tester.pumpAndSettle();
}
