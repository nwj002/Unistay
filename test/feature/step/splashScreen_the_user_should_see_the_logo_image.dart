// import 'package:flutter_test/flutter_test.dart';
//
// Future<void> theUserShouldSeeTheLogoImage(WidgetTester tester) async {
//   throw UnimplementedError();
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';

Future<void> theUserShouldSeeTheLogoImage(WidgetTester tester) async {
  // Create a test app with the SplashScreen1 widget
  await tester.pumpWidget(SplashScreen1());

  // Wait for the SplashScreen1 widget to finish building
  await tester.pumpAndSettle();

  // Verify that the user sees the logo image
  expect(
    find.byWidgetPredicate(
          (widget) => widget is Image && widget.image is AssetImage && (widget.image as AssetImage).assetName == 'assets/images/logo.png',
    ),
    findsOneWidget,
  );
}
