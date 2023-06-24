import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:unistay/screens/AddHostel.dart';

Future<void> iEnterAValidHostelCapacity(WidgetTester tester) async {
  final Finder hostelCapacityField = find.byKey(Key('hostel_capacity_field'));

  await tester.enterText(hostelCapacityField, '50');
}
