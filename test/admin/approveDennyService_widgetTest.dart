import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/logic/modules/service_model.dart';
import 'package:unistay/logic/provider/service_provider.dart';
import 'package:unistay/presentation/screen/admin/service/approveDennyService.dart';
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
  testWidgets('ApproveDennyServiceSceen Widget Test', (WidgetTester tester) async {
    // Mock data: Service with status 0 for testing
    final Service mockService = Service(
      id: '1',
      name: 'John Doe',
      roomNo: '101',
      status: 0,
      serviceTitle: 'Cleaning', // Set the serviceTitle accordingly for the test
      time: DateTime(2023, 7, 25),
      repairDeviceList: ['Device 1', 'Device 2'], // Add repairDeviceList if applicable
      serviceDes: 'Description of the service',
      studentUid: '4', // Add serviceDes if applicable
    );

    // Provide the mock data using a Provider
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ServiceProvider()),
            // Add other necessary providers if required
          ],
          child: ApproveDennyServiceSceen(mockService), // Pass the mock service to the widget
        ),
      ),
    );

    // Verify that the ApproveDennyServiceSceen is loaded correctly
    expect(find.text('Approve/Denny Service'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Room No.'), findsOneWidget);
    expect(find.text('101'), findsOneWidget);
    expect(find.text('25/7/2023'), findsOneWidget);
    expect(find.text('Service'), findsOneWidget);
    expect(find.text('Cleaning'), findsOneWidget);
    expect(find.text('Device 1'), findsOneWidget);
    expect(find.text('Device 2'), findsOneWidget);
    expect(find.text('Description of the service'), findsOneWidget);

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
