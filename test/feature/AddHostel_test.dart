// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_am_on_the_add_hostel_screen.dart';
import './step/i_enter_a_valid_hostel_name.dart';
import './step/i_enter_a_valid_hostel_address.dart';
import './step/i_enter_a_valid_hostel_capacity.dart';
import './step/i_select_an_image.dart';
import './step/i_tap_the_save_button.dart';
import './step/i_should_see_a_success_message.dart';
import './step/i_enter_a_missing_hostel_name.dart';
import './step/i_should_see_an_error_message_indicating_missing_data.dart';

void main() {
  group('''Add Hostel''', () {
    testWidgets('''Successful hostel addition''', (tester) async {
      await iAmOnTheAddHostelScreen(tester);
      await iEnterAValidHostelName(tester);
      await iEnterAValidHostelAddress(tester);
      await iEnterAValidHostelCapacity(tester);
      await iSelectAnImage(tester);
      await iTapTheSaveButton(tester);
      await iShouldSeeASuccessMessage(tester);
    });
    testWidgets('''Hostel addition with missing data''', (tester) async {
      await iAmOnTheAddHostelScreen(tester);
      await iEnterAMissingHostelName(tester);
      await iEnterAValidHostelAddress(tester);
      await iEnterAValidHostelCapacity(tester);
      await iSelectAnImage(tester);
      await iTapTheSaveButton(tester);
      await iShouldSeeAnErrorMessageIndicatingMissingData(tester);
    });
  });
}
