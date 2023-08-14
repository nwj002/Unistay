import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:hostelapplication/logic/provider/complaint_provider.dart';
import 'package:hostelapplication/logic/service/firebase_service.dart';
import 'package:hostelapplication/main.dart';
import 'package:hostelapplication/presentation/screen/admin/adminDashbord.dart';
import 'package:hostelapplication/presentation/screen/admin/complaint/AdmincomplaintScreen.dart';
import 'package:hostelapplication/presentation/screen/admin/complaint/approveDenyCompScreen.dart';
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


    testWidgets('Approve/Deny Complaint List Test', (WidgetTester tester) async {
    final complaintProvider = ComplaintProvider();

    await tester.pumpWidget(
      ChangeNotifierProvider<ComplaintProvider>.value(
        value: complaintProvider,
        child: MaterialApp(
          home: ApproveDenyComplainList(
            Complaint(
              name: 'John Doe',
              roomNo: '123',
              time: DateTime.now(),
              complaintTitle: 'Water Issue',
              complaint: 'There is a leak in the bathroom.',
              studentUid: '212',
              status: 1,
              id: '1',
            ),
          ),
        ),
      ),
    );

    // Check if the app bar title is displayed correctly
    expect(find.text('Approve/Denny Complaint'), findsOneWidget);

    // Check if the complaint details are displayed correctly
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Room No.'), findsOneWidget);
    expect(find.text('Water Issue'), findsOneWidget);
    expect(find.text('There is a leak in the bathroom.'), findsOneWidget);

    // Tap on the "Deny" button and check if the complaint status is changed to 2
    await tester.tap(find.text('Denny'));
    await tester.pumpAndSettle();
    expect(complaintProvider.getCommplaint, 2);

    // Go back to the previous screen
    Navigator.pop(tester.element(find.byType(ApproveDenyComplainList)));
    await tester.pumpAndSettle();

    // Tap on the "Approve" button and check if the complaint status is changed to 1
    await tester.tap(find.text('Approve'));
    await tester.pumpAndSettle();
    expect(complaintProvider.getCommplaint, 1);
  });
}
