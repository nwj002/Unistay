// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> theUserShouldBeRedirectedToTheStudentDashboard(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';
import 'package:hostelapplication/presentation/screen/student/studentDashbord.dart';

Future<void> theUserShouldBeRedirectedToTheStudentDashboard(WidgetTester tester) async {
  // Create a test app with the SplashScreen1 widget
  await tester.pumpWidget(SplashScreen1());

  // Wait for the SplashScreen1 widget to finish building
  await tester.pumpAndSettle();

  // Verify that the user is redirected to the student dashboard screen
  expect(find.byType(StudentDashboardScreen), findsOneWidget);
}
