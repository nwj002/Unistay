import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/logic/modules/service_model.dart';
import 'package:unistay/logic/provider/service_provider.dart';
import 'package:unistay/presentation/screen/admin/service/adminPendingServiceList.dart';
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
  testWidgets('AdminPendingServiceListScreen Widget Test', (WidgetTester tester) async {
    // Mock data: Service with status 0 for testing
    final Service mockService = Service(
      id: '1',
      name: 'John Doe',
      roomNo: '101',
      status: 0,
      serviceTitle: 'Cleaning', // Set the serviceTitle accordingly for the test
      time: DateTime(2023, 7, 25),
      studentUid: '55',
      serviceDes: 'clean the corridors',
      repairDeviceList: [],
    );

    // Provide the mock data using a Provider
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ServiceProvider()),
            // Add other necessary providers if required
          ],
          child: AdminPendingServiceListScreen('Cleaning'), // Set the serviceTitle accordingly for the test
        ),
      ),
    );

    // Verify that the AdminPendingServiceListScreen is loaded correctly
    expect(find.text('Pending Services'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Room - 101'), findsOneWidget);
    expect(find.text('25/7/2023'), findsOneWidget);
    expect(find.text('Pending'), findsOneWidget);

    // Tap on the service item to navigate to the ApproveDennyServiceScreen
    await tester.tap(find.text('John Doe'));
    await tester.pumpAndSettle();

    // Verify that the ApproveDennyServiceScreen is loaded correctly
    expect(find.text('Approve/Denny Service'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text(mockService.name), findsOneWidget);
    expect(find.text('Room No.'), findsOneWidget);
    expect(find.text(mockService.roomNo), findsOneWidget);
    expect(find.text('Time'), findsOneWidget);
    expect(find.text('25/7/2023'), findsOneWidget);

    // Tap on 'Denny' button
    await tester.tap(find.text('Denny'));
    await tester.pumpAndSettle();
    // Verify that the status of the service is changed to 2 (Denny) when tapping on 'Denny' button
    expect(mockService.status, equals(2));

    // Tap on 'Approve' button
    await tester.tap(find.text('Approve'));
    await tester.pumpAndSettle();
    // Verify that the status of the service is changed to 1 (Approve) when tapping on 'Approve' button
    expect(mockService.status, equals(1));
  });
}
