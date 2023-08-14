import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/service/firebase_service.dart';
import 'package:hostelapplication/main.dart';
import 'package:hostelapplication/presentation/screen/admin/adminDashbord.dart';
import 'package:hostelapplication/presentation/screen/admin/complaint/AdmincomplaintScreen.dart';
import 'package:hostelapplication/presentation/screen/admin/leave/AdminLeave.dart';
import 'package:hostelapplication/presentation/screen/admin/notice/adminNotice.dart';
import 'package:hostelapplication/presentation/screen/admin/service/AdminServices.dart';
import 'dart:io';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
  testWidgets('AdminDetailsScreen widget test', (WidgetTester tester) async {
    // await tester.pumpWidget(
    //   MaterialApp(
    //     home: AdminDetailsScreen(),
    //   ),
    // );

    await tester.pumpWidget(MyApp(home: adminDetailsScreenRoute));

    // Verify the initial state of the screen
    expect(find.text('Details'), findsOneWidget);
    // expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(12));
    expect(find.byType(Text), findsNWidgets(10));
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(DataTable), findsOneWidget);
    expect(find.byType(DataRow), findsNWidgets(3));
    expect(find.byType(DataCell), findsNWidgets(6));

    // Verify the text content
    expect(find.text('Admin'), findsOneWidget);
    expect(find.text('Hostel'), findsOneWidget);
    expect(find.text(':   Abdul Kalam illam'), findsOneWidget);
    expect(find.text('Department'), findsOneWidget);
    expect(find.text(':   CSE'), findsOneWidget);
    expect(find.text('Role'), findsOneWidget);
    expect(find.text(':   Rector'), findsOneWidget);
    expect(find.text('Phone No'), findsOneWidget);
    expect(find.text(':   9991001999'), findsOneWidget);
  });
}
