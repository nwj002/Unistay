import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens/AddHostel.dart';

Future<void> iAmOnTheAddHostelScreen(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: AddHostel()));
}
