import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/presentation/screen/student/Drawer/mycomplaint.dart';
import 'package:unistay/logic/provider/complaint_provider.dart';
import 'package:unistay/logic/modules/complaint_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:unistay/logic/service/firebase_service.dart';
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
// void main() {
  testWidgets('Test Mycomplaints Screen', (WidgetTester tester) async {
    // Create a mock list of complaints to be provided by the ComplaintProvider.
    // For demonstration purposes, we are creating two sample complaints.
    final List<Complaint> mockComplaints = [
      Complaint(
        id: 'complaint1',
        studentUid: 'user1',
        complaint: 'Sample complaint 1',
        complaintTitle: 'Complaint 1 Title',
        time: DateTime(2023, 7, 23),
        status: 0, name: '', roomNo: '',
      ),
      Complaint(
        id: 'complaint2',
        studentUid: 'user1',
        complaint: 'Sample complaint 2',
        complaintTitle: 'Complaint 2 Title',
        time: DateTime(2023, 7, 24),
        status: 0, name: '', roomNo: '',
      ),
    ];

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            // Provide the mock ComplaintProvider with the list of mock complaints.
            ChangeNotifierProvider<ComplaintProvider>(
              create: (_) => MockComplaintProvider(mockComplaints),
            ),
            // You can also provide FirebaseAuth if needed.
            // Provide other providers if required.
          ],
          child: Mycomplaints(),
        ),
      ),
    );

    // Verify that the app bar title is correct.
    expect(find.text('My Complaints Request'), findsOneWidget);

    // Verify that the list view contains two items (two mock complaints).
    expect(find.byType(MycomplaintsListModel), findsNWidgets(2));

    // TODO: You can add more specific tests here based on the expected behavior of the screen.
    // For example, you can simulate tapping on the "Remove" button and verify if the complaint is deleted.

    // For demonstration purposes, I'm adding a delay to let the ListView fully scroll.
    await tester.drag(find.byType(SingleChildScrollView), Offset(0, -600));
    await tester.pumpAndSettle();
  });
}

// Mock ComplaintProvider class to be used in the test.
class MockComplaintProvider extends ComplaintProvider {
  final List<Complaint> _complaints;

  MockComplaintProvider(this._complaints);

  @override
  List<Complaint> get complaintList => _complaints;
}
