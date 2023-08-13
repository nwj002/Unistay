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



    testWidgets('StaffDetails Widget Test', (WidgetTester tester) async {
    // await tester.pumpWidget(MaterialApp(
    //   home: StaffDetails(),
    // ));
      await tester.pumpWidget(MyApp(home: staffDetailsScreenRoute)); // route

    // Verify if the app bar title is displayed
    expect(find.text('Staff Details'), findsOneWidget);

    // Verify that the stream builder is working and displaying the staff list
    await tester.pumpAndSettle();

    // Find a specific staff container by its key
    final staffContainer = find.byKey(Key('staff_container_0'));
    expect(staffContainer, findsOneWidget);

    // Tap on the staff container
    await tester.tap(staffContainer);
    await tester.pumpAndSettle();

    // Verify that the onTap action is not implemented
  });
}
