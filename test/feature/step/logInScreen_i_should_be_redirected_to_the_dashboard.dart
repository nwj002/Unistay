// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iShouldBeRedirectedToTheDashboard(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldBeRedirectedToTheDashboard(WidgetTester tester) async {
  // Add  redirection verification logic
  final dashboardScreen = find.text('Dashboard');
  expect(dashboardScreen, findsOneWidget);
}
