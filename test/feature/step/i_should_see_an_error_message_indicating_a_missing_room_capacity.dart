import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> iShouldSeeAnErrorMessageIndicatingAMissingRoomCapacity(WidgetTester tester) async {
  final Finder errorMessage = find.text('Please enter the capacity');
  expect(errorMessage, findsOneWidget);
}
