import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> iEnterAMissingRoomName(WidgetTester tester) async {
  final Finder roomNameField = find.byKey(Key('room_name_field'));
  final Finder addRoomButton = find.byKey(Key('add_room_button'));

  await tester.enterText(roomNameField, '');
  await tester.tap(addRoomButton);
  await tester.pump();
}
