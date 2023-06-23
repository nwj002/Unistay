// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_am_on_the_registration_screen.dart';
import './step/i_enter_invalid_registration_details.dart';
import './step/i_tap_on_the_register_button.dart';
import './step/i_should_see_an_error_message.dart';
import './step/i_enter_an_email_that_already_exists.dart';

void main() {
  group('''User Registration''', () {
    testWidgets('''User registration with invalid details''', (tester) async {
      await iAmOnTheRegistrationScreen(tester);
      await iEnterInvalidRegistrationDetails(tester);
      await iTapOnTheRegisterButton(tester);
      await iShouldSeeAnErrorMessage(tester);
    });
    testWidgets('''User registration with existing email''', (tester) async {
      await iAmOnTheRegistrationScreen(tester);
      await iEnterAnEmailThatAlreadyExists(tester);
      await iTapOnTheRegisterButton(tester);
      await iShouldSeeAnErrorMessage(tester);
    });
  });
}
