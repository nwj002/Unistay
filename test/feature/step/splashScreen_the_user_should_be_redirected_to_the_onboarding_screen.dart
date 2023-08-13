// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> theUserShouldBeRedirectedToTheOnboardingScreen(WidgetTester tester) async {
//   throw UnimplementedError();
// }


import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';
import 'package:hostelapplication/presentation/screen/onBordingScreen.dart';

Future<void> theUserShouldBeRedirectedToTheOnboardingScreen(WidgetTester tester) async {
  // Create a test app with the SplashScreen1 widget
  await tester.pumpWidget(SplashScreen1());

  // Wait for the SplashScreen1 widget to finish building
  await tester.pumpAndSettle();

  // Verify that the user is redirected to the onboarding screen
  expect(find.byType(OnboardingScreen), findsOneWidget);
}
