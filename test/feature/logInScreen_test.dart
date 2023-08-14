// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/logInScreen_i_am_on_the_login_screen.dart';
import './step/logInScreen_i_enter_my_email_as.dart';
import './step/logInScreen_i_enter_my_password_as.dart';
import './step/logInScreen_i_tap_on_the_login_button.dart';
import './step/logInScreen_i_should_be_redirected_to_the_dashboard.dart';
import './step/logInScreen_i_enter_an_incorrect_email.dart';
import './step/logInScreen_i_enter_an_incorrect_password.dart';
import './step/logInScreen_i_should_see_an_alert_box_with_an_error_message.dart';
import './step/logInScreen_i_leave_the_email_field_empty.dart';
import './step/logInScreen_i_leave_the_password_field_empty.dart';
import './step/logInScreen_i_should_see_an_error_message_for_the_email_field.dart';
import './step/logInScreen_i_should_see_an_error_message_for_the_password_field.dart';
import './step/logInScreen_i_enter_my_email_as_admingmailcom.dart';
import './step/logInScreen_i_should_be_redirected_to_the_admin_dashboard.dart';

void main() {
  group('''User Login''', () {
    testWidgets('''Successful Login''', (tester) async {
      await iAmOnTheLoginScreen(tester);
      await iEnterMyEmailAs(tester,"test@gmail.com");
      await iEnterMyPasswordAs(tester,"password");
      await iTapOnTheLoginButton(tester);
      await iShouldBeRedirectedToTheDashboard(tester);
    });
    testWidgets('''Login with Incorrect Credentials''', (tester) async {
      await iAmOnTheLoginScreen(tester);
      await iEnterAnIncorrectEmail(tester);
      await iEnterAnIncorrectPassword(tester);
      await iTapOnTheLoginButton(tester);
      await iShouldSeeAnAlertBoxWithAnErrorMessage(tester);
    });
    testWidgets('''Login with Missing Credentials''', (tester) async {
      await iAmOnTheLoginScreen(tester);
      await iLeaveTheEmailFieldEmpty(tester);
      await iLeaveThePasswordFieldEmpty(tester);
      await iTapOnTheLoginButton(tester);
      await iShouldSeeAnErrorMessageForTheEmailField(tester);
      await iShouldSeeAnErrorMessageForThePasswordField(tester);
    });
    testWidgets('''Login as an Admin''', (tester) async {
      await iAmOnTheLoginScreen(tester);
      await iEnterMyEmailAsAdmingmailcom(tester);
      await iEnterMyPasswordAs(tester,"password");
      await iTapOnTheLoginButton(tester);
      await iShouldBeRedirectedToTheAdminDashboard(tester);
    });
  });
}
