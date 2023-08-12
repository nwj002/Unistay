import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/presentation/screen/admin/complaint/admin_complaint_screen.dart';
import 'package:unistay/presentation/screen/admin/complaint/decline_approve_list_screen.dart';

void main() {
  testWidgets('AdminComplaintScreen widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: AdminComplaintScreen()));

    // Verify if the title text is displayed
    expect(find.text('Complaint'), findsOneWidget);

    // Verify if images and their texts are displayed
    for (var imageText in [
      'Water',
      'Electricity',
      'Worker',
      'Bugs & Insects',
      'Other'
    ]) {
      expect(find.text(imageText), findsOneWidget);
    }

    // Verify if the 'Approved Complaints' and 'Declined Complaints' buttons are displayed
    expect(find.text('Apporoved Complaints'), findsOneWidget);
    expect(find.text('Declined Complaints'), findsOneWidget);
  });

  testWidgets('Navigation test for Apporoved Complaints',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: AdminComplaintScreen()));

        // Tap the 'Approved Complaints' button
        await tester.tap(find.text('Apporoved Complaints'));
        await tester.pumpAndSettle();

        // Verify that the navigation occurred and the correct screen is displayed
        expect(find.byType(DeclineApproveListScreen), findsOneWidget);
      });

  testWidgets('Navigation test for Declined Complaints',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: AdminComplaintScreen()));

        // Tap the 'Declined Complaints' button
        await tester.tap(find.text('Declined Complaints'));
        await tester.pumpAndSettle();

        // Verify that the navigation occurred and the correct screen is displayed
        expect(find.byType(DeclineApproveListScreen), findsOneWidget);
      });
}
