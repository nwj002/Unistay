// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> theUserIsRedirectedToTheAppropriateScreenBasedOnTheirUserType(WidgetTester tester) async {
//   throw UnimplementedError();
// }


import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';
import 'package:hostelapplication/presentation/screen/admin/adminDashbord.dart';
import 'package:hostelapplication/presentation/screen/student/studentDashbord.dart';
import 'package:hostelapplication/presentation/screen/onBordingScreen.dart';

Future<void> theUserIsRedirectedToTheAppropriateScreenBasedOnTheirUserType(WidgetTester tester, {required String userType}) async {
  // Create a mock FirebaseAuth instance
  final auth = MockFirebaseAuth();

  // Create a test app with the SplashScreen1 widget
  await tester.pumpWidget(SplashScreen1());

  // Set the current user based on the provided userType
  if (userType == 'admin') {
    await auth.signInWithEmailAndPassword(
      email: 'admin@gmail.com',
      password: 'password',
    );
  } else if (userType == 'student') {
    await auth.signInWithEmailAndPassword(
      email: 'student@gmail.com',
      password: 'password',
    );
  } else {
    await auth.signOut();
  }

  // Rebuild the widget to handle the user type redirection logic
  await tester.pump();

  // Wait for the SplashScreen1 widget to finish building
  await tester.pumpAndSettle();

  // Verify the redirection based on the user type
  if (userType == 'admin') {
    expect(find.byType(AdminDashbordScreen), findsOneWidget);
  } else if (userType == 'student') {
    expect(find.byType(StudentDashboardScreen), findsOneWidget);
  } else {
    expect(find.byType(OnboardingScreen), findsOneWidget);
  }
}
