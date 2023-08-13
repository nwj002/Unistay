// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> theUserIsLoggedInAsAdminWithEmailAdmingmailcom(WidgetTester tester) async {
//   throw UnimplementedError();
// }


import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';

Future<void> theUserIsLoggedInAsAdminWithEmailAdmingmailcom(WidgetTester tester) async {
  // Create a mock FirebaseAuth instance
  final auth = MockFirebaseAuth();

  // Sign in the user as an admin with email 'admin@gmail.com'
  await auth.signInWithEmailAndPassword(
    email: 'admin@gmail.com',
    password: 'password',
  );

  // Create a test app with the SplashScreen1 widget
  await tester.pumpWidget(SplashScreen1());

  // Wait for the SplashScreen1 widget to finish building
  await tester.pumpAndSettle();
}
