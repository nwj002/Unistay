// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_am_on_the_add_rooms_screen.dart';
import './step/i_enter_a_valid_room_name.dart';
import './step/i_enter_a_valid_room_capacity.dart';
import './step/i_tap_the_add_room_button.dart';
import './step/i_should_see_a_success_message.dart';
import './step/i_enter_a_missing_room_name.dart';
import './step/i_should_see_an_error_message_indicating_a_missing_room_name.dart';
import './step/i_enter_a_missing_room_capacity.dart';
import './step/i_should_see_an_error_message_indicating_a_missing_room_capacity.dart';

void main() {
  group('''Add Rooms''', () {
    testWidgets('''Successful room addition''', (tester) async {
      // await iAmOnTheAddRoomsScreen(tester);
      // await iEnterAValidRoomName(tester);
      await iEnterAValidRoomCapacity(tester);
      await iTapTheAddRoomButton(tester);
      await iShouldSeeASuccessMessage(tester);
    });
    testWidgets('''Room addition with missing room name''', (tester) async {
      await iAmOnTheAddRoomsScreen(tester);
      await iEnterAMissingRoomName(tester);
      await iEnterAValidRoomCapacity(tester);
      await iTapTheAddRoomButton(tester);
      await iShouldSeeAnErrorMessageIndicatingAMissingRoomName(tester);
    });
    testWidgets('''Room addition with missing room capacity''', (tester) async {
      await iAmOnTheAddRoomsScreen(tester);
      await iEnterAValidRoomName(tester);
      await iEnterAMissingRoomCapacity(tester);
      await iTapTheAddRoomButton(tester);
      await iShouldSeeAnErrorMessageIndicatingAMissingRoomCapacity(tester);
    });
  });
}
