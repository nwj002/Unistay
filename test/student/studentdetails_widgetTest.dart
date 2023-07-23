import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/core/constant/string.dart';
import 'package:unistay/main.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:unistay/logic/service/firebase_service.dart';
import 'dart:io';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
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

  testWidgets('Test StudentDetailScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(MaterialApp(
    //   home: StudentDetailScreen(),
    // ));
    await tester.pumpWidget(MyApp(home: studentDetailScreenRoute));

    // Verify that the "Details" title is present.
    expect(find.text('Details'), findsOneWidget);

    // Verify that the "Save" button is initially not present.
    expect(find.text('Save'), findsNothing);

    // Tap on the edit icon to select a file.
    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();

    // Verify that the file picker dialog is displayed.
    expect(find.byType(Dialog), findsOneWidget);

    // Choose a file from the file picker dialog.
    // Assuming you have a test file in your test folder.
    // Replace 'test/test_image.png' with the path to your test file.
    await tester.tap(find.text('test_image.png'));
    await tester.pumpAndSettle();

    // Verify that the "Save" button is now present after selecting a file.
    expect(find.text('Save'), findsOneWidget);

    // Tap on the "Save" button.
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    // Verify that the loading indicator is shown after tapping "Save".
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // TODO: You can add more tests here based on the expected behavior of the screen.
    // For example, verifying the user data display, and more interactions.

    // For demonstration purposes, I'm adding a delay to let the loading indicator disappear.
    await tester.pump(Duration(seconds: 2));

    // Verify that the loading indicator disappears after saving the image.
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}
