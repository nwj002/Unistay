import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> iEnterAMissingRoomCapacity(WidgetTester tester) async {
  final Finder capacityField = find.byKey(Key('capacity_field'));
  final Finder addRoomButton = find.byKey(Key('add_room_button'));

  await tester.enterText(capacityField, '');
  await tester.tap(addRoomButton);
  await tester.pump();
}
