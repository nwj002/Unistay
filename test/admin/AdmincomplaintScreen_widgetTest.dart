import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/core/constant/string.dart';
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
    testWidgets('Admin Complaint Screen Test', (WidgetTester tester) async {
    // await tester.pumpWidget(MaterialApp(
    //   home: AdminComplaintScreen(),
    // ));
      await tester.pumpWidget(MyApp(home: complaintListScreenRoute)); // route

    // Check if the app bar title is displayed correctly
    expect(find.text('Complaint'), findsOneWidget);

    // Check if the grid items are displayed correctly
    expect(find.byType(GestureDetector), findsNWidgets(5));
    expect(find.byType(Card), findsNWidgets(5));

    // Tap on a grid item and check if it navigates to the PendingComplainListScreen
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();
    expect(find.byType(PendingComplainListScreen), findsOneWidget);

    // Go back to the AdminComplaintScreen
    Navigator.pop(tester.element(find.byType(PendingComplainListScreen)));
    await tester.pumpAndSettle();

    // Check if the "Approved Complaints" card is displayed correctly
    expect(find.text('Apporoved Complaints'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);

    // Tap on the "Approved Complaints" card and check if it navigates to the DeclineApproveListScreen
    await tester.tap(find.text('Apporoved Complaints'));
    await tester.pumpAndSettle();
    expect(find.byType(DeclineApproveListScreen), findsOneWidget);

    // Go back to the AdminComplaintScreen
    Navigator.pop(tester.element(find.byType(DeclineApproveListScreen)));
    await tester.pumpAndSettle();

    // Check if the "Declined Complaints" card is displayed correctly
    expect(find.text('Declined Complaints'), findsOneWidget);
    expect(find.byIcon(Icons.error), findsOneWidget);

    // Tap on the "Declined Complaints" card and check if it navigates to the DeclineApproveListScreen
    await tester.tap(find.text('Declined Complaints'));
    await tester.pumpAndSettle();
    expect(find.byType(DeclineApproveListScreen), findsOneWidget);
  });
}
