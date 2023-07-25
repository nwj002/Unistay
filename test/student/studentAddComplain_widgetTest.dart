import 'dart:io';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/logic/modules/userData_model.dart';
import 'package:unistay/logic/provider/complaint_provider.dart';
import 'package:unistay/logic/service/firebase_service.dart';
import 'package:unistay/presentation/screen/student/complains/studentAddComplain.dart';
import 'package:provider/provider.dart';
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
  testWidgets('StudentAddComplaintScreen Test', (WidgetTester tester) async {
    // Create a mock list of UserData.
    List<UserData> mockUserData = [
      UserData(
        id: '1',
        firstName: 'John',
        lastName: 'Doe',
        roomNo: '101',
        email: 'test@test.com',
        mobileNo: '876544343',
        userimage: '',
        time: DateTime.now(),
      ),
    ];

    // Wrap the StudentAddComplaintScreen with Provider widgets for testing.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<List<UserData>?>(
            create: (_) => mockUserData,
          ),
          ChangeNotifierProvider<ComplaintProvider>(
            create: (_) => ComplaintProvider(),
          ),
        ],
        child: MaterialApp(
          home: StudentAddComplaintScreen(
            'Complaint Title',
            '1',
          ),
        ),
      ),
    );

    // Verify if the 'Name' is displayed correctly.
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);

    // Verify if the 'Room No.' is displayed correctly.
    expect(find.text('Room No.'), findsOneWidget);
    expect(find.text('101'), findsOneWidget);

    // Verify if the 'Date' is displayed correctly (as it depends on the current date).
    expect(find.text(DateTime.now().toString().substring(0, 10)), findsOneWidget);

    // Enter text into the TextFormField.
    final complaintTextField = find.byType(TextFormField);
    await tester.enterText(complaintTextField, 'Test complaint text');

    // Tap the FloatingActionButton to save the complaint.
    final floatingActionButton = find.byType(FloatingActionButton);
    await tester.tap(floatingActionButton);
    await tester.pump();

    // Verify that the complaint is saved and the screen is popped.
    expect(find.text('Test complaint text'), findsOneWidget);
    expect(find.byType(StudentAddComplaintScreen), findsNothing);
  });
}
