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
  testWidgets('RegistrationScreen widget test', (WidgetTester tester) async {
    // await tester.pumpWidget(
    //   MaterialApp(
    //     home: RegistrationScreen(),
    //   ),
    // );
    await tester.pumpWidget(MyApp(home: registrationScreenRoute));

    // Verify the initial state of the screen
    expect(find.text('My Hostel'), findsOneWidget);
    expect(find.text('WELCOME'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(6));
    expect(find.byType(GestureDetector), findsNWidgets(2));
    expect(find.text('Register'), findsOneWidget);
    expect(find.text('Already Registered?'), findsOneWidget);

    // Enter text into the text fields
    await tester.enterText(find.byType(TextFormField).first, 'John');
    await tester.enterText(find.byType(TextFormField).at(1), 'Doe');
    await tester.enterText(find.byType(TextFormField).at(2), '1234567890');
    await tester.enterText(find.byType(TextFormField).at(3), 'Room 101');
    await tester.enterText(find.byType(TextFormField).at(4), 'john.doe@example.com');
    await tester.enterText(find.byType(TextFormField).at(5), 'password');

    // Tap on the Register button
    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();

    // Verify that the loading indicator is shown
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the loading indicator to disappear
    await tester.pump(const Duration(seconds: 1));

    // Verify that the loading indicator is no longer visible
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Verify that the alert dialog is shown
    expect(find.text('ALERT'), findsOneWidget);
    expect(find.text('Failed to register user'), findsOneWidget);

    // Tap on the "Already Registered?" text
    await tester.tap(find.text('Already Registered?'));
    await tester.pumpAndSettle();

    // Verify that the screen navigates to the login screen
    expect(find.text('Login'), findsOneWidget);
  });
}
