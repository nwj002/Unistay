// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iEnterAValidPassword(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unistay/screens/RegisterScreen.dart';

Future<void> iEnterAValidPassword(WidgetTester tester, String password) async {
  final passwordFieldFinder = find.byKey(Key('password_field'));
  expect(passwordFieldFinder, findsOneWidget);

  await tester.enterText(passwordFieldFinder, password);
  await tester.pumpAndSettle();

  // You can add additional assertions if needed
  expect(find.text(password), findsOneWidget);
}

