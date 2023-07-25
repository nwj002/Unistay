// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iShouldBeRedirectedToTheAdminDashboard(WidgetTester tester) async {
//   throw UnimplementedError();
// }


import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldBeRedirectedToTheAdminDashboard(WidgetTester tester) async {
  // Add  redirection verification logic
  final adminDashboardScreen = find.text('Admin Dashboard');
  expect(adminDashboardScreen, findsOneWidget);
}
