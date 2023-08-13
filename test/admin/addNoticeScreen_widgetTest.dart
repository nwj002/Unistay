import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/logic/provider/notice_provider.dart';
import 'package:hostelapplication/presentation/screen/admin/notice/addNoticeScreen.dart';
import 'package:provider/provider.dart';
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
    HttpOverrides.global = null; });
  group('AddNoticeScreen Widget Test', () {
    testWidgets('Widget Renders Correctly', (WidgetTester tester) async {
      // Mock the NoticeProvider using a ChangeNotifierProxyProvider
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<NoticeProvider>(
            create: (_) => NoticeProvider(),
          ),
          ChangeNotifierProxyProvider<NoticeProvider, NoticeProvider>(
            create: (_) => NoticeProvider(),
            update: (_, noticeProvider, __) => noticeProvider,
          ),
        ],
        child: MaterialApp(
          home: AddNoticeScreen(),
        ),
      ));

      // Verify if the app bar title is displayed as "Add Notice"
      expect(find.text('Add Notice'), findsOneWidget);

      // Find the text field for typing the notice
      final noticeTextField = find.byType(TextFormField);
      expect(noticeTextField, findsOneWidget);

      // Find the "Add Attachment" button
      final addAttachmentButton = find.byKey(Key('addAttachmentButton'));
      expect(addAttachmentButton, findsOneWidget);

      // Tap the "Add Attachment" button
      await tester.tap(addAttachmentButton);
      await tester.pumpAndSettle();

      // Verify that the attachment selection dialog is displayed
      final attachmentDialog = find.byType(FilePicker);
      expect(attachmentDialog, findsOneWidget);

      // You can add more test cases as needed for other widgets and interactions.
    });
  });
}
