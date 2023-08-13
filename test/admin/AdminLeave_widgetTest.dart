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





    testWidgets('AdminLeaveScreen Widget Test', (WidgetTester tester) async {
    // // Build our app and trigger a frame.
    // await tester.pumpWidget(MaterialApp(
    //   home: AdminLeaveScreen(),
    // ));
      await tester.pumpWidget(MyApp(home: adminLeaveScreenRoute)); // route


      // Verify if the app bar title is displayed
    expect(find.text('Leave'), findsOneWidget);

    // Verify if the list view is displayed
    expect(find.byType(ListView), findsOneWidget);

    // Verify that the leave list is empty initially
    expect(find.text('No Leave Request :)'), findsOneWidget);

    // Add a test leave to the leave list
    final testLeaveName = 'John Doe';
    final testLeaveRoomNo = '101';
    await tester.runAsync(() async {
      await tester.enterText(find.byType(TextFormField).first, testLeaveName);
      await tester.enterText(find.byType(TextFormField).at(1), testLeaveRoomNo);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
    });

    // Verify that the test leave is displayed in the list view
    expect(find.text(testLeaveName), findsOneWidget);
    expect(find.text('Room No. : $testLeaveRoomNo'), findsOneWidget);

    // Tap on the test leave in the list view
    await tester.tap(find.byKey(Key('admin_leavelist_model_0')));
    await tester.pumpAndSettle();

    // Verify that the navigation to ApproveDennyLeaveScreen is triggered
    expect(find.text('Approve/Deny Leave'), findsOneWidget);

    // Navigate back to the AdminLeaveScreen
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    // Verify that the navigation back to AdminLeaveScreen works
    expect(find.text('Leave'), findsOneWidget);
  });
}
