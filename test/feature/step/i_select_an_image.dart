import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens/AddHostel.dart';

Future<void> iSelectAnImage(WidgetTester tester) async {
  final Finder addImageButton = find.byIcon(Icons.add_a_photo_sharp);

  await tester.tap(addImageButton);
  await tester.pumpAndSettle(); // Wait for the dialog to appear

  final Finder galleryButton = find.text('Gallery');

  await tester.tap(galleryButton);
  await tester.pumpAndSettle(); // Wait for the image picker to open

  // You can add additional code here to simulate selecting an image from the gallery
}
