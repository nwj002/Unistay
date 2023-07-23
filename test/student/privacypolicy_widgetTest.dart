import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
  testWidgets('Test Privacy Policy Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(MaterialApp(home: PrivacyPolicyPage()));
    await tester.pumpWidget(MyApp(home: privacyRoute));
    // Verify that the app bar title is correct.
    expect(find.text('Privacy Policy'), findsOneWidget);

    // Verify that the page contains the expected text widgets.
    expect(find.text('Privacy Policy'), findsOneWidget);
    expect(find.text('Last updated: July 13, 2023'), findsOneWidget);
    expect(find.text('This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.'), findsOneWidget);
    // Add more specific tests for other sections and texts as needed.

    // For demonstration purposes, I'm adding a delay to let the SingleChildScrollView fully scroll.
    await tester.drag(find.byType(SingleChildScrollView), Offset(0, -600));
    await tester.pumpAndSettle();
  });
}
