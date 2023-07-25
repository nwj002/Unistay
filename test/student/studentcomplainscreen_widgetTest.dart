import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:unistay/presentation/screen/student/complains/StudentComplainScreen.dart';
import 'package:unistay/presentation/screen/student/complains/StudentPastComplaint.dart';
import 'package:unistay/presentation/screen/student/complains/studentAddComplain.dart';
import 'dart:io';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:unistay/logic/service/firebase_service.dart';
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
    HttpOverrides.global = null; });
  testWidgets('StudentComplainScreen Test', (WidgetTester tester) async {
    // Create a mock FirebaseAuth instance.
    final auth = MockFirebaseAuth();

    // Create a mock FirebaseUser.
    final user = MockUser(
      isAnonymous: false,
      uid: 'test_user_id',
      email: 'test@example.com',
    );

    // Sign in the mock user.
    await auth.signInWithEmailAndPassword(
      email: 'test@example.com',
      password: 'password',
    );

    // Wrap the StudentComplainScreen with MaterialApp for testing.
    await tester.pumpWidget(
      MaterialApp(
        home: StudentComplainScreen(),
      ),
    );

    // Verify if the app bar title is displayed correctly.
    expect(find.text('Complain'), findsOneWidget);

    // Tap the FloatingActionButton to navigate to the StudentPastComplaintScreen.
    final floatingActionButton = find.byType(FloatingActionButton);
    await tester.tap(floatingActionButton);
    await tester.pumpAndSettle();

    // Verify if the navigation to StudentPastComplaintScreen is successful.
    expect(find.byType(StudentPastComplaintScreen), findsOneWidget);

    // Go back to the StudentComplainScreen.
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    // Verify if the StudentComplainScreen is displayed again.
    expect(find.byType(StudentComplainScreen), findsOneWidget);

    // Tap on one of the complaint cards to navigate to StudentAddComplaintScreen.
    await tester.tap(find.text('Water'));
    await tester.pumpAndSettle();

    // Verify if the navigation to StudentAddComplaintScreen is successful.
    expect(find.byType(StudentAddComplaintScreen), findsOneWidget);
  });
}
