import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unistay/logic/provider/notice_provider.dart';
import 'package:unistay/presentation/screen/admin/notice/addNoticeScreen.dart';
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
    HttpOverrides.global = null; });

  testWidgets('AddNoticeScreen Widget Test', (WidgetTester tester) async {
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

    // Enter some text into the notice text field
    await tester.enterText(noticeTextField, 'This is a test notice.');

    // Verify if the text is entered correctly in the notice text field
    expect(find.text('This is a test notice.'), findsOneWidget);

    // Find the "Add Attachment" button
    final addAttachmentButton = find.widgetWithText(ElevatedButton, 'Add Attachment');
    expect(addAttachmentButton, findsOneWidget);

    // Tap on the "Add Attachment" button
    await tester.tap(addAttachmentButton);
    await tester.pump();

    // Find the "OK" button on the file picker dialog
    final okButton = find.widgetWithText(TextButton, 'OK'); //FAIL
    expect(okButton, findsOneWidget);

    // Tap on the "OK" button to select a file
    await tester.tap(okButton);
    await tester.pump();

    // Verify if the selected file name is displayed
    expect(find.text('TestFileName.jpg'), findsOneWidget);

    // Find the "Done" button (FloatingActionButton)
    final doneButton = find.byIcon(Icons.done);
    expect(doneButton, findsOneWidget);

    // Tap on the "Done" button to save the notice
    await tester.tap(doneButton);
    await tester.pumpAndSettle();

    // Verify if the notice is saved and the screen is popped back to the previous screen
    expect(find.text('Add Notice'), findsNothing);
  });
}
