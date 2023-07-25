// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: unused_import, directives_ordering
//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// import './step/i_am_on_the_admin_register_screen.dart';
// import './step/i_enter_valid_registration_details.dart';
// import './step/i_tap_on_the_sign_up_button.dart';
// import './step/i_should_be_registered_successfully.dart';
// import './step/i_enter_an_invalid_email_address.dart';
// import './step/i_should_see_an_error_message_for_invalid_email.dart';
// import './step/i_enter_an_invalid_phone_number.dart';
// import './step/i_should_see_an_error_message_for_invalid_phone_number.dart';
// import './step/i_enter_passwords_that_do_not_match.dart';
// import './step/i_should_see_an_error_message_for_password_mismatch.dart';
// import './step/i_leave_the_location_field_empty.dart';
// import './step/i_should_see_an_error_message_for_empty_location.dart';
//
// void main() {
//   group('''Admin Registration''', () {
//     testWidgets('''Successful Admin Registration''', (tester) async {
//       await iAmOnTheAdminRegisterScreen(tester);
//       await iEnterValidRegistrationDetails(tester);
//       // await iTapOnTheSignUpButton(tester);
//       // await iShouldBeRegisteredSuccessfully(tester);
//     });
//     testWidgets('''Admin Registration with Invalid Email''', (tester) async {
//       await iAmOnTheAdminRegisterScreen(tester);
//       await iEnterAnInvalidEmailAddress(tester);
//       await iTapOnTheSignUpButton(tester);
//       await iShouldSeeAnErrorMessageForInvalidEmail(tester);
//     });
//     testWidgets('''Admin Registration with Invalid Phone Number''', (tester) async {
//       await iAmOnTheAdminRegisterScreen(tester);
//       await iEnterAnInvalidPhoneNumber(tester, '1112223334');
//       await iTapOnTheSignUpButton(tester);
//       await iShouldSeeAnErrorMessageForInvalidPhoneNumber(tester);
//     });
//     testWidgets('''Admin Registration with Password Mismatch''', (tester) async {
//       await iAmOnTheAdminRegisterScreen(tester);
//       await iEnterPasswordsThatDoNotMatch(tester);
//       await iTapOnTheSignUpButton(tester);
//       await iShouldSeeAnErrorMessageForPasswordMismatch(tester);
//     });
//     testWidgets('''Admin Registration with Empty Location''', (tester) async {
//       await iAmOnTheAdminRegisterScreen(tester);
//       await iLeaveTheLocationFieldEmpty(tester);
//       await iTapOnTheSignUpButton(tester);
//       await iShouldSeeAnErrorMessageForEmptyLocation(tester);
//     });
//   });
// }
