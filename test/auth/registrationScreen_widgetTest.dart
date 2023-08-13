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

    // Verify that the widgets are displayed on the screen
    expect(find.text("UNISTAY"), findsOneWidget);
    expect(find.text("a place to call home"), findsOneWidget);
    expect(find.text("First Name"), findsOneWidget);
    expect(find.text("Last Name"), findsOneWidget);
    expect(find.text("Mobile No."), findsOneWidget);
    expect(find.text("Room No"), findsOneWidget);
    expect(find.text("Email"), findsOneWidget);
    expect(find.text("Password"), findsOneWidget);

    // Enter some test values in the text fields
    await tester.enterText(find.byType(TextFormField).at(0), 'John');
    await tester.enterText(find.byType(TextFormField).at(1), 'Doe');
    await tester.enterText(find.byType(TextFormField).at(2), '1234567890');
    await tester.enterText(find.byType(TextFormField).at(3), '101');
    await tester.enterText(find.byType(TextFormField).at(4), 'john.doe@example.com');
    await tester.enterText(find.byType(TextFormField).at(5), 'password123');

    // Tap the "Register" button
    await tester.tap(find.text("Register"));
    await tester.pump();

    // Verify that the loading indicator is shown
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the loading indicator to disappear (assuming it is a blocking dialog)
    await tester.pumpAndSettle();

    // Verify that the loading indicator is gone and the alert dialog is shown
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text("ALERT"), findsOneWidget);
    expect(find.text("Invalid email format"), findsOneWidget);

    // Tap the "Already Registered?" text
    await tester.tap(find.text("Already Registered?"));
    await tester.pumpAndSettle();

    // Verify that the login screen is displayed after tapping the "Already Registered?" text
    expect(find.text("Log In"), findsOneWidget);
    expect(find.text("Password"), findsOneWidget);
  });
}
