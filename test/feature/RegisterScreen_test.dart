// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering




import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_am_on_the_registration_screen.dart';
import './step/i_enter_a_valid_email.dart';
import './step/i_enter_a_valid_phone_number.dart';
import './step/i_enter_a_valid_password.dart';
import './step/i_confirm_the_password.dart';
import './step/i_tap_the_sign_up_button.dart';
import './step/i_should_be_redirected_to_the_verification_screen.dart';
import './step/i_enter_an_invalid_email.dart';
import './step/i_should_see_an_error_message_indicating_an_invalid_email.dart';
import './step/i_enter_an_invalid_phone_number.dart';
import './step/i_should_see_an_error_message_indicating_an_invalid_phone_number.dart';
import './step/i_enter_an_invalid_password.dart';
import './step/i_should_see_an_error_message_indicating_an_invalid_password.dart';
import './step/i_enter_a_different_password_for_confirmation.dart';
import './step/i_should_see_an_error_message_indicating_password_mismatch.dart';

void main() {
  group('User Registration', () {
    testWidgets('Successful registration', (tester) async {
      await iAmOnTheRegistrationScreen(tester);
      await iEnterAValidEmail(tester, 'user@example.com');
      await iEnterAValidPhoneNumber(tester, '1234567890');
      await iEnterAValidPassword(tester, 'StrongPassword123!');
      await iConfirmThePassword(tester, 'StrongPassword123!');
      // await iTapTheSignUpButton(tester);
      // await iShouldBeRedirectedToTheVerificationScreen(tester);
    });
    testWidgets('Registration with invalid email', (tester) async {
      await iAmOnTheRegistrationScreen(tester);
      await iEnterAnInvalidEmail(tester, 'invalid');
      await iEnterAValidPhoneNumber(tester, '1234567890');
      await iEnterAValidPassword(tester, 'StrongPassword123!');
      await iConfirmThePassword(tester, 'StrongPassword123!');
      await iTapTheSignUpButton(tester);
      await iShouldSeeAnErrorMessageIndicatingAnInvalidEmail(tester);
    });
    testWidgets('Registration with invalid phone number', (tester) async {
      await iAmOnTheRegistrationScreen(tester);
      await iEnterAValidEmail(tester, 'user@example.com');
      await iEnterAnInvalidPhoneNumber(tester, 'invalid');
      await iEnterAValidPassword(tester, 'StrongPassword123!');
      await iConfirmThePassword(tester, 'StrongPassword123!');
      await iTapTheSignUpButton(tester);
      await iShouldSeeAnErrorMessageIndicatingAnInvalidPhoneNumber(tester);
    });
    testWidgets('Registration with invalid password', (tester) async {
      await iAmOnTheRegistrationScreen(tester);
      await iEnterAValidEmail(tester, 'user@example.com');
      await iEnterAValidPhoneNumber(tester, '1234567890');
      await iEnterAnInvalidPassword(tester, 'weak');
      await iConfirmThePassword(tester, 'StrongPassword123!');
      await iTapTheSignUpButton(tester);
      await iShouldSeeAnErrorMessageIndicatingAnInvalidPassword(tester);
    });
    testWidgets('Registration with mismatched passwords', (tester) async {
      await iAmOnTheRegistrationScreen(tester);
      await iEnterAValidEmail(tester, 'user@example.com');
      await iEnterAValidPhoneNumber(tester, '1234567890');
      await iEnterAValidPassword(tester, 'StrongPassword123!');
      await iEnterADifferentPasswordForConfirmation(tester, 'DifferentPassword123!');
      await iTapTheSignUpButton(tester);
      await iShouldSeeAnErrorMessageIndicatingPasswordMismatch(tester);
    });
  });
}
