// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> theUserIsNotLoggedIn(WidgetTester tester) async {
//   throw UnimplementedError();
// }


import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';

Future<void> theUserIsNotLoggedIn(WidgetTester tester) async {
  // Create a mock FirebaseAuth instance
  final auth = MockFirebaseAuth();

  // Sign out the user (simulate not being logged in)
  await auth.signOut();

  // Create a test app with the SplashScreen1 widget
  await tester.pumpWidget(SplashScreen1());

  // Wait for the SplashScreen1 widget to finish building
  await tester.pumpAndSettle();
}
