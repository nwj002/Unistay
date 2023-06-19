// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_am_on_the_registration_screen.dart';
import './step/i_enter_my_email_address_as_testexamplecom.dart';
import './step/i_enter_my_phone_number_as1234567890.dart';
import './step/i_enter_my_password_as_password.dart';
import './step/i_confirm_my_password_as_password.dart';
import './step/i_submit_the_registration_form.dart';
import './step/i_should_see_a_success_message_registered.dart';

void main() {
  group('''Registration Screen as user''', () {
    testWidgets('''Successful registration as user''', (tester) async {
      await iAmOnTheRegistrationScreen(tester);
      await iEnterMyEmailAddressAsTestexamplecom(tester);
      await iEnterMyPhoneNumberAs1234567890(tester);
      await iEnterMyPasswordAsPassword(tester);
      await iConfirmMyPasswordAsPassword(tester);
      await iSubmitTheRegistrationForm(tester);
      await iShouldSeeASuccessMessageRegistered(tester);
    });
  });
}
