import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> iEnterAValidRoomCapacity(WidgetTester tester) async {
  final Finder capacityField = find.byKey(Key('capacity_field'));

  await tester.enterText(capacityField, '5');
}
