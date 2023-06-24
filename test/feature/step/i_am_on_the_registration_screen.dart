// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iAmOnTheRegistrationScreen(WidgetTester tester) async {
//   throw UnimplementedError();
// }




import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens/RegisterScreen.dart';

Future<void> iAmOnTheRegistrationScreen(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
  await tester.pumpAndSettle();

  // You can add additional assertions if needed
  expect(find.text('SIGN UP'), findsOneWidget);
}
