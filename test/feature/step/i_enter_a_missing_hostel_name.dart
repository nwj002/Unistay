import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens/AddHostel.dart';

Future<void> iEnterAMissingHostelName(WidgetTester tester) async {
  final Finder hostelNameField = find.byKey(Key('hostel_name_field'));

  await tester.enterText(hostelNameField, '');
}
