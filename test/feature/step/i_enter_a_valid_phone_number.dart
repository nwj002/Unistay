// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iEnterAValidPhoneNumber(WidgetTester tester) async {
//   throw UnimplementedError();
// }


import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unistay/screens/RegisterScreen.dart';

Future<void> iEnterAValidPhoneNumber(WidgetTester tester, String phoneNumber) async {
  final phoneNumberFieldFinder = find.byKey(Key('phone_number_field'));
  expect(phoneNumberFieldFinder, findsOneWidget);

  await tester.enterText(phoneNumberFieldFinder, phoneNumber);
  await tester.pumpAndSettle();

  // You can add additional assertions if needed
  expect(find.text(phoneNumber), findsOneWidget);
}
