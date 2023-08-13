// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> theUserShouldSeeALoadingIndicator(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';

Future<void> theUserShouldSeeALoadingIndicator(WidgetTester tester) async {
  // Create a test app with the SplashScreen1 widget
  await tester.pumpWidget(SplashScreen1());

  // Wait for the SplashScreen1 widget to finish building
  await tester.pumpAndSettle();

  // Verify that the user sees a loading indicator
  expect(find.byType(CircularProgressIndicator), findsOneWidget);
}
