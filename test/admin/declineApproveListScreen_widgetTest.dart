import 'dart:io';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/logic/modules/complaint_model.dart';
import 'package:unistay/logic/provider/complaint_provider.dart';
import 'package:unistay/logic/service/firebase_service.dart';
import 'package:unistay/presentation/screen/admin/complaint/declineApproveListScreen.dart';
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
    HttpOverrides.global = null;
  });


  testWidgets('DeclineApproveListScreen Widget Test', (WidgetTester tester) async {
    // Create a mock list of complaints with different statuses for testing
    final List<Complaint> complaintList = [
      Complaint(
        id: '1',
        name: 'John Doe',
        roomNo: '101',
        time: DateTime(2023, 7, 21),
        status: 0,
        complaint: 'Excessive noise during night hours.',
        complaintTitle: 'noise',
        studentUid: '1',
      ),
      Complaint(
        id: '2',
        name: 'Jane Smith',
        roomNo: '102',
        time: DateTime(2023, 7, 20),
        status: 1,
        complaint: 'Leaking faucet in the bathroom.',
        complaintTitle: 'leak',
        studentUid: '2',
      ),
    ];

    // Create a mock ComplaintProvider
    final complaintProvider = ComplaintProvider();
    complaintProvider.getCommplaint;
    // complaintProvider.setComplaintList(complaintList);

    // Build the DeclineApproveListScreen widget with a Provider
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: complaintProvider),
        ],
        child: MaterialApp(
          home: DeclineApproveListScreen(1),
        ),
      ),
    );

    // Verify that the app bar title for approved complaints is displayed correctly
    expect(find.text('Approved complaints'), findsOneWidget);

    // Verify that the list of approved complaints is displayed correctly
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Room - 101'), findsOneWidget);
    expect(find.text('21/7/2023'), findsOneWidget);
    expect(find.text('Pending'), findsOneWidget);
    expect(find.text('Excessive noise during night hours.'), findsOneWidget);

    // Verify that the app bar title for declined complaints is displayed correctly
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: complaintProvider),
        ],
        child: MaterialApp(
          home: DeclineApproveListScreen(2),
        ),
      ),
    );

    expect(find.text('Declined complaints'), findsOneWidget);

    // Verify that the list of declined complaints is displayed correctly
    expect(find.text('Jane Smith'), findsOneWidget);
    expect(find.text('Room - 102'), findsOneWidget);
    expect(find.text('20/7/2023'), findsOneWidget);
    expect(find.text('Approved'), findsOneWidget);
    expect(find.text('Leaking faucet in the bathroom.'), findsOneWidget);
  });
}
