import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:hostelapplication/logic/service/firebase_service.dart';
import 'package:hostelapplication/main.dart';
import 'package:hostelapplication/presentation/screen/admin/adminDashbord.dart';
import 'package:hostelapplication/presentation/screen/admin/complaint/AdmincomplaintScreen.dart';
import 'package:hostelapplication/presentation/screen/admin/complaint/declineApproveListScreen.dart';
import 'package:hostelapplication/presentation/screen/admin/complaint/pendingComplaintListScreen.dart';
import 'package:hostelapplication/presentation/screen/admin/leave/AdminLeave.dart';
import 'package:hostelapplication/presentation/screen/admin/notice/adminNotice.dart';
import 'package:hostelapplication/presentation/screen/admin/service/AdminServices.dart';
import 'dart:io';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:hostelapplication/presentation/screen/onBordingScreen.dart';

import 'package:hostelapplication/presentation/screen/student/studentDashbord.dart';
import 'package:provider/provider.dart';

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


    testWidgets('Decline/Approve Complaint List Test', (WidgetTester tester) async {
      // await tester.pumpWidget(MyApp(home: AdminComplaintScreen())); // route
    final List<Complaint> mockComplaints = [
      Complaint(
        name: 'John Doe',
        roomNo: '123',
        time: DateTime.now(),
        status: 1, // Approved status
        complaintTitle: 'Water Issue',
        complaint: 'There is a leak in the bathroom.',
        id: '1',
        studentUid: '2',
      ),
      Complaint(
        name: 'Jane Smith',
        roomNo: '456',
        time: DateTime.now(),
        status: 2, // Declined status
        complaintTitle: 'Electrical Issue',
        complaint: 'The lights are flickering in the room.',
        id: '1',
        studentUid: '2',
      ),
      Complaint(
        name: 'Bob Johnson',
        roomNo: '789',
        time: DateTime.now(),
        status: 0, // Pending status
        complaintTitle: 'Cleaning Issue',
        complaint: 'The room was not cleaned properly.',
        id: '1',
        studentUid: '2',
      ),
    ];

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<List<Complaint>?>(
            create: (_) => mockComplaints,
          ),
        ],
        child: MaterialApp(
          home: DeclineApproveListScreen(1),
        ),
      ),
    );

    // Check if the app bar title is displayed correctly for approved complaints
    expect(find.text('Approved complaints'), findsOneWidget);

    // Check if approved complaint details are displayed correctly
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Room - 123'), findsOneWidget);
    expect(find.text('Approved'), findsOneWidget);
    expect(find.text('There is a leak in the bathroom.'), findsOneWidget);

    // Switch to declined complaints
    await tester.tap(find.text('Approved complaints'));
    await tester.pumpAndSettle();

    // Check if the app bar title is displayed correctly for declined complaints
    expect(find.text('Declined complaints'), findsOneWidget);

    // Check if declined complaint details are displayed correctly
    expect(find.text('Jane Smith'), findsOneWidget);
    expect(find.text('Room - 456'), findsOneWidget);
    expect(find.text('Declined'), findsOneWidget);
    expect(find.text('The lights are flickering in the room.'), findsOneWidget);

    // Switch back to approved complaints
    await tester.tap(find.text('Declined complaints'));
    await tester.pumpAndSettle();

    // Check if no complaints message is displayed when there are no complaints
    expect(find.text('No Complaints :)'), findsNothing);

    // Remove all complaints from the list
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<List<Complaint>?>(
            create: (_) => [],
          ),
        ],
        child: MaterialApp(
          home: DeclineApproveListScreen(1),
        ),
      ),
    );

    // Check if no complaints message is displayed when there are no complaints
    expect(find.text('No Complaints :)'), findsOneWidget);
  });
}
