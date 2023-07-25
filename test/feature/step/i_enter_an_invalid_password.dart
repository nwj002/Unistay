// // import 'package:flutter_test/flutter_test.dart';
// //
// // Future<void> iEnterAnInvalidPassword(WidgetTester tester) async {
// //   throw UnimplementedError();
// // }
//
//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:unistay/screens/RegisterScreen.dart';
//
// Future<void> iEnterAnInvalidPassword(WidgetTester tester, String invalidPassword) async {
//   final passwordFieldFinder = find.byKey(Key('password_field'));
//   expect(passwordFieldFinder, findsOneWidget);
//
//   await tester.enterText(passwordFieldFinder, invalidPassword);
//   await tester.pumpAndSettle();
//
//   // You can add additional assertions if needed
//   expect(find.text(invalidPassword), findsOneWidget);
// }
