import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> iShouldSeeASuccessMessage(WidgetTester tester) async {
  final Finder successMessage = find.text('Room added successfully');
  expect(successMessage, findsOneWidget);
}
