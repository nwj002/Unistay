import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
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
  testWidgets('ForgotPasswordScreen Widget Test', (WidgetTester tester) async {
    // Pump the widget
    // await tester.pumpWidget(MaterialApp(
    //   home: ForgotPasswordScreen(),
    // ));

    await tester.pumpWidget(MyApp(home: forgotPasswordScreenRoute));

    // Verify that the "Forgot Password" and "Reset Your Password" texts are displayed
    expect(find.text("Forgot Password"), findsOneWidget);
    expect(find.text("Reset Your Password"), findsOneWidget);

    // Enter a valid email address in the text field
    await tester.enterText(find.byType(TextFormField), 'test@example.com');

    // Tap the "Verify" button
    await tester.tap(find.text("Verify"));
    await tester.pump();

    // // Verify that the SnackBar with the success message is displayed
    // expect(find.text("Email link sent to test@example.com"), findsOneWidget);
  });
}
