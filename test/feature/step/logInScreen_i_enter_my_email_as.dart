// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iEnterMyEmailAs(WidgetTester tester, dynamic param1) async {
//   throw UnimplementedError();
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iEnterMyEmailAs(WidgetTester tester, String email) async {
  final emailField = find.widgetWithText(TextFormField, 'Email');
  await tester.enterText(emailField, email);
}
