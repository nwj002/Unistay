import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/logic/modules/leave_model.dart';
import 'package:unistay/logic/provider/leave_provider.dart';
import 'package:unistay/presentation/screen/admin/leave/ApproveDenyLeave.dart';
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
  testWidgets('ApproveDennyLeaveScreen Widget Test', (WidgetTester tester) async {
    // Mock data: Leave with status 0 for testing
    final Leave mockLeave = Leave(
      id: '1',
      name: 'John Doe',
      roomNo: '101',
      status: 0,
      dateOfLeave: DateTime(2023, 7, 25),
      dateOfComing: DateTime(2023, 7, 27),
      totalDay: 3,
      leaveReason: 'Family emergency',
      studentUid: '',
      leaveApplyDate: DateTime(2023, 7, 25),
    );

    // Provide the mock data using a Provider
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LeaveProvider()),
          ],
          child: ApproveDennyLeaveScreen(mockLeave),
        ),
      ),
    );

    // Verify that the ApproveDennyLeaveScreen is loaded correctly
    expect(find.text('Approve/Denny Leave'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text(mockLeave.name), findsOneWidget);
    expect(find.text('Room No.'), findsOneWidget);
    expect(find.text(mockLeave.roomNo), findsOneWidget);
    expect(find.text('Date of leaving'), findsOneWidget);
    expect(find.text('25/7/2023'), findsOneWidget);
    expect(find.text('Date Of coming'), findsOneWidget);
    expect(find.text('27/7/2023'), findsOneWidget);
    expect(find.text('Total Day'), findsOneWidget);
    expect(find.text('${mockLeave.totalDay}'), findsOneWidget);
    // expect(find.text('Leave Reason'), findsOneWidget);
    expect(find.text(mockLeave.leaveReason), findsOneWidget);

    // Tap on 'Denny' button
    await tester.tap(find.text('Denny'));
    await tester.pumpAndSettle();
    // Verify that the status of the leave is changed to 2 (Denny) when tapping on 'Denny' button
    expect(mockLeave.status, equals(2));

    // Tap on 'Approve' button
    await tester.tap(find.text('Approve'));
    await tester.pumpAndSettle();
    // Verify that the status of the leave is changed to 1 (Approve) when tapping on 'Approve' button
    expect(mockLeave.status, equals(1));
  });
}
