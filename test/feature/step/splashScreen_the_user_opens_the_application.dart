// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> theUserOpensTheApplication(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';

Future<void> theUserOpensTheApplication(WidgetTester tester) async {
  // Create a test app with the SplashScreen1 widget
  await tester.pumpWidget(SplashScreen1());

  // Wait for the SplashScreen1 widget to finish building
  await tester.pumpAndSettle();
}
