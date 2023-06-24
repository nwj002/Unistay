import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> iShouldSeeAnErrorMessageIndicatingAMissingRoomName(WidgetTester tester) async {
  final Finder errorMessage = find.text('Please enter a room name');
  expect(errorMessage, findsOneWidget);
}
