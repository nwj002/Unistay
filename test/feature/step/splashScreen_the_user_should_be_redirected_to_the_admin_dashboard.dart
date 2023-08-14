// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> theUserShouldBeRedirectedToTheAdminDashboard(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';
import 'package:hostelapplication/presentation/screen/admin/adminDashbord.dart';

Future<void> theUserShouldBeRedirectedToTheAdminDashboard(WidgetTester tester) async {
  // Create a test app with the SplashScreen1 widget
  await tester.pumpWidget(SplashScreen1());

  // Wait for the SplashScreen1 widget to finish building
  await tester.pumpAndSettle();

  // Verify that the user is redirected to the admin dashboard screen
  expect(find.byType(AdminDashbordScreen), findsOneWidget);
}
