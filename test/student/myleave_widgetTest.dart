import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/presentation/screen/student/Drawer/myleave.dart';
import 'package:unistay/logic/provider/leave_provider.dart';
import 'package:unistay/logic/modules/leave_model.dart';
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
  testWidgets('Test MyLeave Screen', (WidgetTester tester) async {
    // Create a mock list of leaves to be provided by the LeaveProvider.
    // For demonstration purposes, we are creating two sample leaves.
    final List<Leave> mockLeaves = [
      Leave(
        id: 'leave1',
        studentUid: 'user1',
        dateOfLeave: DateTime(2023, 7, 25),
        dateOfComing: DateTime(2023, 7, 28),
        leaveReason: 'Sample leave reason 1',
        totalDay: 4,
        status: 0,  name: '', roomNo: '', leaveApplyDate: DateTime(2023, 7, 28),
      ),
      Leave(
        id: 'leave2',
        studentUid: 'user1',
        dateOfLeave: DateTime(2023, 7, 30),
        dateOfComing: DateTime(2023, 8, 2),
        leaveReason: 'Sample leave reason 2',
        totalDay: 4,
        status: 0, name: '', roomNo: '', leaveApplyDate: DateTime(2023, 7, 28),
      ),
    ];

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            // Provide the mock LeaveProvider with the list of mock leaves.
            ChangeNotifierProvider<LeaveProvider>(
              create: (_) => MockLeaveProvider(mockLeaves),
            ),
            // You can also provide FirebaseAuth if needed.
            // Provide other providers if required.
          ],
          child: MyLeave(),
        ),
      ),
    );

    // Verify that the app bar title is correct.
    expect(find.text('My Leaves Request'), findsOneWidget);

    // Verify that the list view contains two items (two mock leaves).
    expect(find.byType(MyLeaveListModel), findsNWidgets(2));


    // For demonstration purposes, I'm adding a delay to let the ListView fully scroll.
    await tester.drag(find.byType(SingleChildScrollView), Offset(0, -600));
    await tester.pumpAndSettle();
  });
}

// Mock LeaveProvider class to be used in the test.
class MockLeaveProvider extends LeaveProvider {
  final List<Leave> _leaves;

  MockLeaveProvider(this._leaves);

  @override
  List<Leave> get leaveList => _leaves;
}
