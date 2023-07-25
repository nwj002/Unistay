// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iTapOnTheLoginButton(WidgetTester tester) async {
//   throw UnimplementedError();
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iTapOnTheLoginButton(WidgetTester tester) async {
  // Add  login button tapping logic
  final loginButton = find.widgetWithText(GestureDetector, 'Login');
  await tester.tap(loginButton);
  await tester.pumpAndSettle();
}
