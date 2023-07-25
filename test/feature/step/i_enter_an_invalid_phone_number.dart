// // import 'package:flutter_test/flutter_test.dart';
// //
// // Future<void> iEnterAnInvalidPhoneNumber(WidgetTester tester) async {
// //   throw UnimplementedError();
// // }
//
//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:unistay/screens/RegisterScreen.dart';
//
// Future<void> iEnterAnInvalidPhoneNumber(WidgetTester tester, String invalidPhoneNumber) async {
//   final phoneNumberFieldFinder = find.byKey(Key('phone_number_field'));
//   expect(phoneNumberFieldFinder, findsOneWidget);
//
//   await tester.enterText(phoneNumberFieldFinder, invalidPhoneNumber);
//   await tester.pumpAndSettle();
//
//   // You can add additional assertions if needed
//   expect(find.text(invalidPhoneNumber), findsOneWidget);
// }
