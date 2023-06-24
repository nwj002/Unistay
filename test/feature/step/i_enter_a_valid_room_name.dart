import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> iEnterAValidRoomName(WidgetTester tester) async {
  final Finder roomNameField = find.byKey(Key('room_name_field'));

  await tester.enterText(roomNameField, 'Meeting Room');
}
