import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/logic/modules/leave_model.dart';
import 'package:unistay/presentation/screen/student/leave/studentLeaveList.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:unistay/logic/service/firebase_service.dart';
import 'dart:io';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // setup mock firebase core
    setupFirebaseCoreMocks();
    // dummy config for firebase
    await Firebase.initializeApp(
      name: 'test',
      options: const FirebaseOptions(
        apiKey: 'test',
        appId: 'test',
        messagingSenderId: 'test',
        projectId: 'test',
      ),
    );
    // mock instances
    final auth = MockFirebaseAuth();
    final firestore = FakeFirebaseFirestore();
    final storage = MockFirebaseStorage();

    // set firebase service to mock instances
    FirebaseService.db = firestore;
    FirebaseService.auth = auth;
    FirebaseService.storage = storage.ref();

    // network/http fix
    HttpOverrides.global = null;
  });
  testWidgets('Test Student Approve/Deny Leave List Page',
      (WidgetTester tester) async {
    // Mock the data for the leave list
    // You can create a list of Leave objects here to simulate the data fetched from the provider
    List<Leave> mockLeaveList = [
      Leave(
          name: 'John Doe',
          roomNo: '101',
          leaveApplyDate: DateTime.now(),
          leaveReason: 'Going on vacation',
          status: 1,
          id: '',
          studentUid: '',
          dateOfLeave: DateTime(2023, 7, 28),
          dateOfComing: DateTime(2023, 7, 30), totalDay: 2),
      Leave(
          name: 'Jane Smith',
          roomNo: '102',
          leaveApplyDate: DateTime.now(),
          leaveReason: 'Family emergency',
          status: 2,
          id: '',
          studentUid: '',
          dateOfLeave: DateTime(2023, 7, 28),
          dateOfComing: DateTime(2023, 7, 30), totalDay: 2,)
    ];

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StudentApproveDennyLeaveList(),
          // You might need to mock the required providers here using MultiProvider
        ),
      ),
    );

    // Verify that the app bar title is correct.
    expect(find.text('Leave'), findsOneWidget);

    // Verify the presence of the leave list items
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Jane Smith'), findsOneWidget);

    // TODO: Add more specific tests here based on the expected behavior of the page.
    // For example, you can verify the status texts and other UI elements based on the mock data.

    // For demonstration purposes, I'm adding a delay to let the ListView fully scroll.
    await tester.drag(find.byType(ListView), Offset(0, -800));
    await tester.pumpAndSettle();
  });
}
