import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
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
  testWidgets('Test Help Screen', (WidgetTester tester) async {
    // // Build our app and trigger a frame.
    // await tester.pumpWidget(MaterialApp(
    //   home: HelpScreen(),
    // ));
    await tester.pumpWidget(MyApp(home: helpscreenRoute));
    // Verify that the app bar title is correct.
    expect(find.text('Help'), findsOneWidget);

    // Verify the presence of each section with its associated content.
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Here you can see the all updates about your hostel. The information posted here is officially approved by management.'), findsOneWidget);
    expect(find.text('Complaint Screen'), findsOneWidget);
    expect(find.text('Here you are able to post your complaints you are facing in your hostel'), findsOneWidget);
    expect(find.text('if the complaints were accepted and the problems were solved, you\'ll get a notification'), findsOneWidget);
    expect(find.text('Service Screen'), findsOneWidget);
    expect(find.text('Here you are able to post about your repaired devices like fan, light, taps and doors.'), findsOneWidget);
    expect(find.text('if the complaints were accepted and the problems were solved, you\'ll get a notification'), findsOneWidget);
    expect(find.text('Leave'), findsOneWidget);
    expect(find.text('Here you can apply for leave'), findsOneWidget);
    expect(find.text('if the leave were accepted, you\'ll get a notification'), findsOneWidget);

    // TODO: You can add more specific tests here based on the expected behavior of the screen.
    // For example, you can simulate tapping on each GestureDetector and verify if the respective screen is opened.

    // For demonstration purposes, I'm adding a delay to let the ListView fully scroll.
    await tester.drag(find.byType(SingleChildScrollView), Offset(0, -600));
    await tester.pumpAndSettle();
  });
}
