// // import 'package:flutter_test/flutter_test.dart';
// //
// // Future<void> iEnterAnInvalidEmail(WidgetTester tester) async {
// //   throw UnimplementedError();
// // }
//
//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:unistay/screens/RegisterScreen.dart';
//
// Future<void> iEnterAnInvalidEmail(WidgetTester tester, String invalidEmail) async {
//   final emailFieldFinder = find.byKey(Key('email_field'));
//   expect(emailFieldFinder, findsOneWidget);
//
//   await tester.enterText(emailFieldFinder, invalidEmail);
//   await tester.pumpAndSettle();
//
//   // You can add additional assertions if needed
//   expect(find.text(invalidEmail), findsOneWidget);
// }
