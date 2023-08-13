// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> theUserIsLoggedInAsAStudentWithEmailOtherThanAdmingmailcom(WidgetTester tester) async {
//   throw UnimplementedError();
// }


import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';

Future<void> theUserIsLoggedInAsAStudentWithEmailOtherThanAdmingmailcom(WidgetTester tester) async {
  // Create a mock FirebaseAuth instance
  final auth = MockFirebaseAuth();

  // Sign in the user as a student with an email other than 'admin@gmail.com'
  await auth.signInWithEmailAndPassword(
    email: 'student@gmail.com',
    password: 'password',
  );

  // Create a test app with the SplashScreen1 widget
  await tester.pumpWidget(SplashScreen1());

  // Wait for the SplashScreen1 widget to finish building
  await tester.pumpAndSettle();
}
