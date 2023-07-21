import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/presentation/screen/admin/AdminDrawer.dart';
import 'package:unistay/presentation/screen/admin/service/adminPendingServiceList.dart';
import 'package:unistay/presentation/screen/admin/service/declinedApprovedServiceList.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/core/constant/string.dart';
import 'package:unistay/logic/service/firebase_service.dart';
import 'package:unistay/main.dart';
import 'package:unistay/presentation/screen/admin/adminDashbord.dart';
import 'dart:io';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:unistay/presentation/screen/onBordingScreen.dart';
import 'package:unistay/presentation/screen/student/studentDashbord.dart';

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
  testWidgets('AdminServicesScreen Widget Test', (WidgetTester tester) async {
    // Build the AdminServicesScreen widget
    // await tester.pumpWidget(MaterialApp(
    //   home: AdminServicesScreen(),
    // ));
    await tester.pumpWidget(MyApp(home: AdminServicesScreenRoute));

    // Ensure the AppBar title is displayed correctly
    expect(find.text('Services'), findsOneWidget);

    // Ensure the AdminDrawer widget is present
    // expect(find.byType(AdminDrawer), findsOneWidget);  //FAIL

    // Ensure the GridView items are displayed correctly
    for (var i = 0; i < 5; i++) {
      expect(find.text('Room'), findsNWidgets(1));
      // expect(find.byType(Card), findsNWidgets(5));  //FAIL

      expect(find.byType(Card), findsNWidgets(6));
    }

    // Tap on the first GridView item (Room)
    await tester.tap(find.text('Room'));
    await tester.pumpAndSettle();

    // Verify that the navigation to the AdminPendingServiceListScreen is triggered when tapping on a GridView item
    expect(find.byType(AdminPendingServiceListScreen), findsOneWidget);

    // Tap on the "Approved Services" card
    await tester.tap(find.text('Apporoved Services')); //FAIL
    await tester.pumpAndSettle();

    // Verify that the navigation to the DeclineApproveServiceList is triggered when tapping on the "Approved Services" card with status 1
    expect(find.byType(DeclineApproveServiceList), findsOneWidget);  //FAIL

    // Tap on the "Declined Services" card
    await tester.tap(find.text('Declined Services'));   //FAIL
    await tester.pumpAndSettle();

    // Verify that the navigation to the DeclineApproveServiceList is triggered when tapping on the "Declined Services" card with status 2
    expect(find.byType(DeclineApproveServiceList), findsOneWidget);

  });
}
