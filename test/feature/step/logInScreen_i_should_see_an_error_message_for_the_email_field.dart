// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> iShouldSeeAnErrorMessageForTheEmailField(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldSeeAnErrorMessageForTheEmailField(WidgetTester tester) async {
  // Add  error message verification logic
  final errorText = find.text('Please enter a valid email');
  expect(errorText, findsOneWidget);
}
