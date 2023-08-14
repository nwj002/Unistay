// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iAmOnTheLoginScreen(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/presentation/screen/auth/logInScreen.dart';

Future<void> iAmOnTheLoginScreen(WidgetTester tester) async {
  await tester.pumpWidget(LogInScreen());

  expect(find.text('UNISTAY'), findsOneWidget);
  expect(find.text('a place to call home'), findsOneWidget);
  expect(find.byType(TextFormField), findsNWidgets(2));
  expect(find.byType(GestureDetector), findsNWidgets(2));
  expect(find.text('Login'), findsOneWidget);
  expect(find.text('Not Registered yet?'), findsOneWidget);
  expect(find.text('Sign Up'), findsOneWidget);
}
