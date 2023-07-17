import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/service/firebase_service.dart';
import 'package:hostelapplication/main.dart';
import 'package:hostelapplication/presentation/screen/admin/adminDashbord.dart';
import 'package:hostelapplication/presentation/screen/admin/complaint/AdmincomplaintScreen.dart';
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
  testWidgets('AdminDashbordScreen widget test', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp(home: adminDashbordScreenRoute));

    // Verify the initial state of the screen
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.byType(SafeArea), findsWidgets);
    expect(find.byType(AdminHome), findsOneWidget);

    // Verify the tab bar items
    expect(find.byIcon(Icons.home_outlined), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.byIcon(Icons.description_outlined), findsOneWidget);
    expect(find.text('Complaint'), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.wrench), findsOneWidget);
    expect(find.text('Services'), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.person_crop_circle_badge_minus), findsOneWidget);
    expect(find.text('Leave'), findsOneWidget);

    // Tap on the second tab
    await tester.tap(find.byIcon(Icons.description_outlined));
    await tester.pumpAndSettle();

    // Verify the state after tapping the second tab
    expect(find.byType(AdminComplaintScreen), findsOneWidget);

    // Tap on the third tab
    await tester.tap(find.byIcon(CupertinoIcons.wrench));
    await tester.pumpAndSettle();

    // Verify the state after tapping the third tab
    expect(find.byType(AdminServicesScreen), findsOneWidget);

    // Tap on the fourth tab
    await tester.tap(find.byIcon(CupertinoIcons.person_crop_circle_badge_minus));
    await tester.pumpAndSettle();

    // Verify the state after tapping the fourth tab
    expect(find.byType(AdminLeaveScreen), findsOneWidget);
  });
}
