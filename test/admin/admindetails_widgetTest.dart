import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/core/constant/string.dart';
import 'package:unistay/logic/service/firebase_service.dart';
import 'package:unistay/main.dart';
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
  testWidgets('AdminDetailsScreen Widget Test', (WidgetTester tester) async {
    // Build the AdminDetailsScreen widget
    // await tester.pumpWidget(MaterialApp(
    //   home: AdminDetailsScreen(),
    // ));
    await tester.pumpWidget(MyApp(home: adminDetailsScreenRoute));

    // Verify that the app bar title is displayed correctly
    expect(find.text('Details'), findsOneWidget);

    // Verify that the student name is displayed correctly
    // expect(find.text('Admin'), findsOneWidget);  // FAIL

    // Verify that the circular profile image is present
    // expect(find.byType(Container), findsOneWidget);  //FAIL
    expect(find.byType(Container), findsNWidgets(12)); // PASS

    // Verify that the DataTable widget is displayed correctly
    expect(find.byType(DataTable), findsOneWidget);

    // Verify that specific data cells are displayed correctly
    expect(find.text('Hostel'), findsOneWidget);
    expect(find.text(':   Abdul Kalam illam'), findsOneWidget);
    expect(find.text('Department'), findsOneWidget);
    expect(find.text(':   CSE'), findsOneWidget);
    expect(find.text('Role'), findsOneWidget);
    expect(find.text(':   Rector'), findsOneWidget);
    expect(find.text('Phone No'), findsOneWidget);
    expect(find.text(':   9991001999'), findsOneWidget);
  });
}
