// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iEnterADifferentPasswordForConfirmation(WidgetTester tester) async {
//   throw UnimplementedError();
// }


import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unistay/screens/RegisterScreen.dart';

Future<void> iEnterADifferentPasswordForConfirmation(WidgetTester tester, String confirmPassword) async {
  final confirmFieldFinder = find.byKey(Key('confirm_password_field'));
  expect(confirmFieldFinder, findsOneWidget);

  await tester.enterText(confirmFieldFinder, confirmPassword);
  await tester.pumpAndSettle();

  // You can add additional assertions if needed
  expect(find.text(confirmPassword), findsOneWidget);
}