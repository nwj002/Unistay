import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/service/firebase_service.dart';
import 'package:hostelapplication/main.dart';
import 'package:hostelapplication/presentation/screen/admin/Drawer/staffDetails.dart';
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



    testWidgets('AddStaffDetails Widget Test', (WidgetTester tester) async {
    // await tester.pumpWidget(MaterialApp(
    //   home: AddStaffDetails(),
    // ));
      await tester.pumpWidget(MyApp(home: addStaffDetailsScreenRoute)); // route

    // Verify if all input fields and buttons are displayed
    expect(find.text('Add Hostel Staff Details'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.text('Staff Image'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4));
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Verify that the image picker option dialog is not shown initially
    expect(find.text('Pick Image From'), findsNothing);

    // Tap on the "Staff Image" button to trigger the image picker option dialog
    await tester.tap(find.text('Staff Image'));
    await tester.pumpAndSettle();

    // Verify that the image picker option dialog is shown
    expect(find.text('Pick Image From'), findsOneWidget);

    // Tap on the "Gallery" option in the image picker dialog
    await tester.tap(find.text('Gallery'));
    await tester.pumpAndSettle();

    // Verify that the image picker dialog is closed and an image is displayed
    expect(find.text('Pick Image From'), findsNothing);
    expect(find.byType(Image), findsOneWidget);

    // Tap on the "Save" button
    await tester.tap(find.text('Save'));
    await tester.pump();

    // Verify that the "Invalid Data" dialog is shown due to empty fields
    expect(find.text('Invalid Data'), findsOneWidget);

    // Fill in the required fields
    await tester.enterText(find.byKey(Key("staff_name_field")), 'John Doe');
    await tester.enterText(find.byKey(Key("staff_address_field")), 'Sample Address');
    await tester.enterText(find.byKey(Key("staff_department_field")), 'Sample Department');
    await tester.enterText(find.byKey(Key("staff_phonenumber_field")), '123456789');

    // Tap on the "Staff Image" button to trigger the image picker option dialog
    await tester.tap(find.text('Staff Image'));
    await tester.pumpAndSettle();

    // Tap on the "Gallery" option in the image picker dialog
    await tester.tap(find.text('Gallery'));
    await tester.pumpAndSettle();

    // Tap on the "Save" button again
    await tester.tap(find.text('Save'));
    await tester.pump();

    // Verify that the "Success" dialog is shown after successful form submission
    expect(find.text('Success'), findsOneWidget);

    // Tap on the "OK" button in the "Success" dialog
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Verify that the navigation back to the "StaffDetails" screen is performed
    expect(find.byType(StaffDetails), findsOneWidget);
  });
}
