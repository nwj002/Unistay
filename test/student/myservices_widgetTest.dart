import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/presentation/screen/student/Drawer/myservices.dart';
import 'package:unistay/logic/provider/service_provider.dart';
import 'package:unistay/logic/modules/service_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/core/constant/string.dart';
import 'package:unistay/logic/service/firebase_service.dart';
import 'package:unistay/main.dart';
import 'package:unistay/presentation/screen/admin/adminDashbord.dart';
import 'dart:io';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:unistay/presentation/screen/onBordingScreen.dart';
import 'package:unistay/presentation/screen/student/studentDashbord.dart';

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
  testWidgets('Test MyServicesrequest Screen', (WidgetTester tester) async {
    // Create a mock list of services to be provided by the ServiceProvider.
    // For demonstration purposes, we are creating two sample services.
    final List<Service> mockServices = [
      Service(
        id: 'service1',
        studentUid: 'user1',
        time: DateTime(2023, 7, 25),
        repairDeviceList: ['fan', 'light'],
        serviceDes: 'Sample service description 1',
        status: 0,name: '', roomNo: '', serviceTitle: '',
      ),
      Service(
        id: 'service2',
        studentUid: 'user1',
        time: DateTime(2023, 7, 30),
        repairDeviceList: ['tap', 'door'],
        serviceDes: 'Sample service description 2',
        status: 0, name: '', roomNo: '', serviceTitle: '',
      ),
    ];

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            // Provide the mock ServiceProvider with the list of mock services.
            ChangeNotifierProvider<ServiceProvider>(
              create: (_) => MockServiceProvider(mockServices),
            ),
            // You can also provide FirebaseAuth if needed.
            // Provide other providers if required.
          ],
          child: Myservicesrequest(),
        ),
      ),
    );

    // Verify that the app bar title is correct.
    expect(find.text('My Service Request'), findsOneWidget);

    // Verify that the list view contains two items (two mock services).
    expect(find.byType(MyServiceListModel), findsNWidgets(2));


    // For demonstration purposes, I'm adding a delay to let the ListView fully scroll.
    await tester.drag(find.byType(SingleChildScrollView), Offset(0, -600));
    await tester.pumpAndSettle();
  });
}

// Mock ServiceProvider class to be used in the test.
class MockServiceProvider extends ServiceProvider {
  final List<Service> _services;

  MockServiceProvider(this._services);

  @override
  List<Service> get servicesList => _services;
}
