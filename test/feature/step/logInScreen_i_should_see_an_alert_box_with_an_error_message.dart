// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iShouldSeeAnAlertBoxWithAnErrorMessage(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldSeeAnAlertBoxWithAnErrorMessage(WidgetTester tester) async {
  // Add  alert box verification logic
  final alertDialog = find.byType(AlertDialog);
  final errorMessage = find.text('Invalid credentials');
  expect(alertDialog, findsOneWidget);
  expect(errorMessage, findsOneWidget);
}
