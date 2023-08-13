import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:hostelapplication/logic/service/firebase_service.dart';
import 'package:hostelapplication/main.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';
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
import 'package:provider/provider.dart';

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
  testWidgets('AdminDrawer widget test', (WidgetTester tester) async {
    // await tester.pumpWidget(
    //   MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider<AuthService>(
    //         create: (_) => AuthService(),
    //       ),
    //     ],
    //     child: MaterialApp(
    //       home: Scaffold(
    //         drawer: AdminDrawer(),
    //       ),
    //     ),
    //   ),
    // );
    await tester.pumpWidget(MyApp(home: adminDashbordScreenRoute));

    // Verify the presence of drawer items
    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.text('Admin'), findsOneWidget);
    expect(find.text('Help'), findsOneWidget);
    expect(find.text('Log out'), findsOneWidget);

    // Tap on the "Help" item
    await tester.tap(find.text('Help'));
    await tester.pumpAndSettle();

    // Verify the navigation to the help screen
    expect(find.text('Help Screen'), findsOneWidget);

    // Tap on the "Log out" item
    await tester.tap(find.text('Log out'));
    await tester.pumpAndSettle();

    // Verify the sign out and navigation to the login screen
    expect(find.text('Log In Screen'), findsOneWidget);
  });
}
