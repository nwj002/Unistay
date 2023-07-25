// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/registrationScreen_i_am_on_the_registration_screen.dart';
import './step/registrationScreen_i_enter_my_first_name_as.dart';
import './step/registrationScreen_i_enter_my_last_name_as.dart';
import './step/registrationScreen_i_enter_my_mobile_number_as.dart';
import './step/registrationScreen_i_enter_my_room_number_as.dart';
import './step/registrationScreen_i_enter_my_email_address_as.dart';
import './step/registrationScreen_i_enter_my_password_as.dart';
import './step/registrationScreen_i_tap_on_the_register_button.dart';
import './step/registrationScreen_i_should_be_redirected_to_the_login_screen.dart';
import './step/registrationScreen_i_leave_the_first_name_field_empty.dart';
import './step/registrationScreen_i_leave_the_last_name_field_empty.dart';
import './step/registrationScreen_i_leave_the_mobile_number_field_empty.dart';
import './step/registrationScreen_i_leave_the_room_number_field_empty.dart';
import './step/registrationScreen_i_enter_an_invalid_email_address.dart';
import './step/registrationScreen_i_should_see_an_error_message_for_the_first_name_field.dart';
import './step/registrationScreen_i_should_see_an_error_message_for_the_last_name_field.dart';
import './step/registrationScreen_i_should_see_an_error_message_for_the_mobile_number_field.dart';
import './step/registrationScreen_i_should_see_an_error_message_for_the_room_number_field.dart';
import './step/registrationScreen_i_should_see_an_error_message_for_the_email_field.dart';
import './step/registrationScreen_i_enter_an_existing_email_address.dart';
import './step/registrationScreen_i_should_see_an_alert_box_with_an_error_message.dart';

void main() {
  group('''User Registration''', () {
    testWidgets('''Successful Registration''', (tester) async {
      await iAmOnTheRegistrationScreen(tester);
      await iEnterMyFirstNameAs(tester, "tester");
      await iEnterMyLastNameAs(tester, "tinker");
      await iEnterMyMobileNumberAs(tester,"9841665831");
      await iEnterMyRoomNumberAs(tester,"210");
      await iEnterMyEmailAddressAs(tester,"test@test.com");
      await iEnterMyPasswordAs(tester,"password");
      await iTapOnTheRegisterButton(tester);
      await iShouldBeRedirectedToTheLoginScreen(tester);
    });
    testWidgets('''Registration with Missing Information''', (tester) async {
      await iAmOnTheRegistrationScreen(tester);
      await iLeaveTheFirstNameFieldEmpty(tester);
      await iLeaveTheLastNameFieldEmpty(tester);
      await iLeaveTheMobileNumberFieldEmpty(tester);
      await iLeaveTheRoomNumberFieldEmpty(tester);
      await iEnterAnInvalidEmailAddress(tester);
      await iEnterMyPasswordAs(tester,"password");
      await iTapOnTheRegisterButton(tester);
      await iShouldSeeAnErrorMessageForTheFirstNameField(tester);
      await iShouldSeeAnErrorMessageForTheLastNameField(tester);
      await iShouldSeeAnErrorMessageForTheMobileNumberField(tester);
      await iShouldSeeAnErrorMessageForTheRoomNumberField(tester);
      await iShouldSeeAnErrorMessageForTheEmailField(tester);
    });
    testWidgets('''Registration with Existing Email''', (tester) async {
      await iAmOnTheRegistrationScreen(tester);
      await iEnterMyFirstNameAs(tester,"tester");
      await iEnterMyLastNameAs(tester,"tinker");
      await iEnterMyMobileNumberAs(tester,"9841665831");
      await iEnterMyRoomNumberAs(tester,"210");
      await iEnterAnExistingEmailAddress(tester);
      await iEnterMyPasswordAs(tester,"password");
      await iTapOnTheRegisterButton(tester);
      await iShouldSeeAnAlertBoxWithAnErrorMessage(tester);
    });
  });
}
