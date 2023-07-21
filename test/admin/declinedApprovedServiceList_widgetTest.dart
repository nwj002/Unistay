import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/logic/provider/service_provider.dart';
import 'package:unistay/logic/modules/service_model.dart';
import 'package:unistay/presentation/screen/admin/service/declinedApprovedServiceList.dart';
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
  testWidgets('DeclineApproveServiceList Widget Test', (WidgetTester tester) async {
    // Mock data: Service with status 0 for testing
    final List<Service> mockServiceList = [
      Service(
        id: '1',
        name: 'John Doe',
        roomNo: '101',
        status: 0,
        serviceTitle: 'Cleaning', // Set the serviceTitle accordingly for the test
        time: DateTime(2023, 7, 25),
        repairDeviceList: ['Device 1', 'Device 2'], // Add repairDeviceList if applicable
        serviceDes: 'Description of the service',
        studentUid: '5', // Add serviceDes if applicable
      ),
      // Add more mock services with different statuses if needed
    ];

    // Provide the mock data using a Provider
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ServiceProvider()),
            // Add other necessary providers if required
          ],
          child: DeclineApproveServiceList(1), // Set the serviceStatus accordingly for the test
        ),
      ),
    );

    // Verify that the DeclineApproveServiceList is loaded correctly with the serviceStatus of 1
    expect(find.text('Approved Service'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Room - 101'), findsOneWidget);
    expect(find.text('25/7/2023'), findsOneWidget);
    expect(find.text('Pending'), findsOneWidget);
    expect(find.text('Description of the service'), findsOneWidget);

    // Switch to serviceStatus 2 (Declined Service)
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ServiceProvider()),
            // Add other necessary providers if required
          ],
          child: DeclineApproveServiceList(2), // Set the serviceStatus accordingly for the test
        ),
      ),
    );

    // Verify that the DeclineApproveServiceList is loaded correctly with the serviceStatus of 2
    expect(find.text('Declined Service'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Room - 101'), findsOneWidget);
    expect(find.text('25/7/2023'), findsOneWidget);
    expect(find.text('Declined'), findsOneWidget);
    expect(find.text('Description of the service'), findsOneWidget);

    // Verify that no complaints are displayed when there is no service data with the provided status
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ServiceProvider()),
            // Add other necessary providers if required
          ],
          child: DeclineApproveServiceList(3), // Set an invalid status for the test
        ),
      ),
    );

    expect(find.text('No Complaints :)'), findsOneWidget);
  });
}
