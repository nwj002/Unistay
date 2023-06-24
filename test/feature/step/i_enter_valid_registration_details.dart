import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens/AdminRegisterScreen.dart';

Future<void> iEnterValidRegistrationDetails(WidgetTester tester) async {
  // Find the name text field
  final nameTextFieldFinder = find.byKey(Key('name_text_field'));

  // Find the email text field
  final emailTextFieldFinder = find.byKey(Key('email_text_field'));

  // Find the phone number text field
  final phoneNumberTextFieldFinder = find.byKey(Key('phone_number_text_field'));

  // Find the password text field
  final passwordTextFieldFinder = find.byKey(Key('password_text_field'));

  // Find the confirm password text field
  final confirmPasswordTextFieldFinder = find.byKey(Key('confirm_password_text_field'));

  // Enter a name
  await tester.enterText(nameTextFieldFinder, 'John Doe');

  // Enter an email address
  await tester.enterText(emailTextFieldFinder, 'johndoe@example.com');

  // Enter a phone number
  await tester.enterText(phoneNumberTextFieldFinder, '1234567890');

  // Enter a password
  await tester.enterText(passwordTextFieldFinder, 'password123');

  // Enter the same password for confirm password
  await tester.enterText(confirmPasswordTextFieldFinder, 'password123');

  // Dismiss the keyboard
  await tester.testTextInput.receiveAction(TextInputAction.done);

  // Wait for the widget to rebuild
  await tester.pumpAndSettle();
}
