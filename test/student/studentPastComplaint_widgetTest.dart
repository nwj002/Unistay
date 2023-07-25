import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/logic/modules/complaint_model.dart';
import 'package:unistay/logic/modules/userData_model.dart';
import 'package:unistay/logic/provider/complaint_provider.dart';
import 'package:unistay/logic/service/firebase_service.dart';
import 'package:unistay/presentation/screen/student/complains/StudentComplainScreen.dart';
import 'package:unistay/presentation/screen/student/complains/StudentPastComplaint.dart';
import 'package:unistay/presentation/screen/student/complains/studentAddComplain.dart';
import 'package:unistay/presentation/screen/student/complains/studentComplaintList.dart';
import 'package:provider/provider.dart';
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

  testWidgets('StudentComplainScreen Test', (WidgetTester tester) async {
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

    // Wrap the StudentComplainScreen with Provider widgets for testing.
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
          home: StudentComplainScreen(),
        ),
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

  testWidgets('StudentComplaintListScreen Test', (WidgetTester tester) async {
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

    // Create a list of mock complaints.
    List<Complaint> mockComplaintList = [
      Complaint(
        complaintTitle: 'Water Issue',
        complaint: 'Water is not available in the hostel.',
        studentUid: 'test_user_id',
        time: DateTime(2023, 7, 22),
        status: 1,id: '', name: '', roomNo: '',
      ),
      Complaint(
        complaintTitle: 'Electrical Issue',
        complaint: 'Electricity fluctuation in the room.',
        studentUid: 'test_user_id',
        time: DateTime(2023, 7, 21),
        status: 2, id: '', name: '', roomNo: '',
      ),
    ];

    // Wrap the StudentComplaintListScreen with Provider widgets for testing.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ComplaintProvider>(
            create: (_) => ComplaintProvider(),
          ),
          Provider<List<Complaint>?>(
            create: (_) => mockComplaintList,
          ),
        ],
        child: MaterialApp(
          home: StudentComplaintListScreen(),
        ),
      ),
    );

    // Verify if the app bar title is displayed correctly.
    expect(find.text('My Complaint'), findsOneWidget);

    // Verify if the complaint list is displayed correctly.
    expect(find.text('Water Issue'), findsOneWidget);
    expect(find.text('Electrical Issue'), findsOneWidget);

    // Verify the complaint status text.
    expect(find.text('Approved'), findsOneWidget);
    expect(find.text('Declined'), findsOneWidget);

    // Verify the complaint content.
    expect(find.text('Water is not available in the hostel.'), findsOneWidget);
    expect(find.text('Electricity fluctuation in the room.'), findsOneWidget);
  });
}
