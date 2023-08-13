// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> theUsersAuthenticationStateChanges(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

Future<void> theUsersAuthenticationStateChanges(WidgetTester tester) async {
  // Create a mock FirebaseAuth instance
  final auth = MockFirebaseAuth();

  // Create a test app with the SplashScreen1 widget
  await tester.pumpWidget(SplashScreen1());

  // Verify that the user is initially not logged in
  expect(auth.currentUser, isNull);

  // Simulate the user being logged in
  await auth.signInWithEmailAndPassword(
    email: 'user@gmail.com',
    password: 'password',
  );

  // Rebuild the widget to reflect the updated authentication state
  await tester.pump();

  // Verify that the user is now logged in
  expect(auth.currentUser, isNotNull);

  // Simulate the user being logged out
  await auth.signOut();

  // Rebuild the widget to reflect the updated authentication state
  await tester.pump();

  // Verify that the user is now logged out
  expect(auth.currentUser, isNull);
}
