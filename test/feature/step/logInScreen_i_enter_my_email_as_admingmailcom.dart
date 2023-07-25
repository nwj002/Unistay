// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iEnterMyEmailAsAdmingmailcom(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iEnterMyEmailAsAdmingmailcom(WidgetTester tester) async {
  final emailField = find.widgetWithText(TextFormField, 'Email');
  await tester.enterText(emailField, 'admin@gmail.com');
}
