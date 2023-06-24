import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> iTapTheAddRoomButton(WidgetTester tester) async {
  final Finder addRoomButton = find.byType(ElevatedButton);

  await tester.tap(addRoomButton);
  await tester.pump();
}
