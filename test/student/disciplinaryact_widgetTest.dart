import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
  testWidgets('Test Disciplinary Screen', (WidgetTester tester) async {
    // // Build our app and trigger a frame.
    // await tester.pumpWidget(MaterialApp(
    //   home: Disciplinary(),
    // ));
    await tester.pumpWidget(MyApp(home: disciplinaryRoute));

    // Verify that the app bar title is correct.
    expect(find.text('Disciplinary Act'), findsOneWidget);

    // Verify the presence of all the rules in the ListView.
    expect(find.text('(Rule 1)  Respect for Others'), findsOneWidget);
    expect(find.text('(Rule 2) Quiet Hours'), findsOneWidget);
    expect(find.text('(Rule 3)  Guest Policy'), findsOneWidget);
    expect(find.text('(Rule 4) Room Maintenance'), findsOneWidget);
    expect(find.text('(Rule 5) Prohibited Items'), findsOneWidget);
    expect(find.text('(Rule 6) Fire Safety'), findsOneWidget);
    expect(find.text('(Rule 7) Personal Responsibility'), findsOneWidget);
    expect(find.text('(Rule 8) Compliance with Staff Instructions'), findsOneWidget);
    expect(find.text('(Rule 9) Non-Discrimination'), findsOneWidget);
    expect(find.text('(Rule 10) Hostel Property'), findsOneWidget);

    // TODO: You can add more specific tests here based on the expected behavior of the screen.
    // For example, checking the content of each rule and ensuring they are displayed correctly.

    // For demonstration purposes, I'm adding a delay to let the ListView fully scroll.
    await tester.drag(find.byType(ListView), Offset(0, -600));
    await tester.pumpAndSettle();
  });
}
