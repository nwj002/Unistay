// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iEnterMyPasswordAs(WidgetTester tester, dynamic param1) async {
//   throw UnimplementedError();
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iEnterMyPasswordAs(WidgetTester tester, String password) async {
  final passwordField = find.widgetWithText(TextFormField, 'Password');
  await tester.enterText(passwordField, password);
}
