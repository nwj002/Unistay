import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';
import 'package:hostelapplication/logic/provider/leave_provider.dart';
import 'package:hostelapplication/presentation/screen/admin/leave/declineApproveLeaveListScreen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('DeclineApproveLeaveListScreen Widget Test', (WidgetTester tester) async {
    // Create a mock list of Leave objects for testing
    final mockLeaveList = [
      Leave(
        id: '1',
        name: 'John Doe',
        roomNo: '101',
        dateOfLeave: DateTime.now(),
        dateOfComing: DateTime.now(),
        totalDay: 5,
        leaveReason: 'Vacation',
        status: 1, studentUid: '',
        leaveApplyDate: DateTime.now(), // Approved status for this mock Leave object
      ),
      Leave(
        id: '2',
        name: 'Jane Smith',
        roomNo: '102',
        dateOfLeave: DateTime.now(),
        dateOfComing: DateTime.now(),
        totalDay: 3,
        leaveReason: 'Family Emergency',
        status: 2, studentUid: '',
        leaveApplyDate: DateTime.now(), // Declined status for this mock Leave object
      ),
    ];

    // Mock the LeaveProvider using a ChangeNotifierProxyProvider
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<LeaveProvider>(
          create: (_) => LeaveProvider(),
        ),
        ChangeNotifierProxyProvider<LeaveProvider, LeaveProvider>(
          create: (_) => LeaveProvider(),
          update: (_, leaveProvider, __) => leaveProvider,
        ),
        Provider<List<Leave>?>(
          create: (_) => mockLeaveList,
        ),
      ],
      child: MaterialApp(
        home: DeclineApproveLeaveListScreen(1), // Passing 1 for Approved status test
      ),
    ));

    // Verify if the app bar title is displayed for "Approved Leave"
    expect(find.text('Approved Leave'), findsOneWidget);

    // Verify if the leave details are displayed for the approved leave
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Room - 101'), findsOneWidget);
    expect(find.text('Pending'), findsOneWidget);

    // Tap on the "Approved" leave to navigate to ApproveDennyLeaveScreen
    await tester.tap(find.text('John Doe'));
    await tester.pumpAndSettle();

    // Verify if the ApproveDennyLeaveScreen is navigated to
    expect(find.text('Approve/Denny Leave'), findsOneWidget);

    // Now test the widget for "Declined Leave" status
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<LeaveProvider>(
          create: (_) => LeaveProvider(),
        ),
        ChangeNotifierProxyProvider<LeaveProvider, LeaveProvider>(
          create: (_) => LeaveProvider(),
          update: (_, leaveProvider, __) => leaveProvider,
        ),
        Provider<List<Leave>?>(
          create: (_) => mockLeaveList,
        ),
      ],
      child: MaterialApp(
        home: DeclineApproveLeaveListScreen(2), // Passing 2 for Declined status test
      ),
    ));

    // Verify if the app bar title is displayed for "Declined Leave"
    expect(find.text('Declined Leave'), findsOneWidget);

    // Verify if the leave details are displayed for the declined leave
    expect(find.text('Jane Smith'), findsOneWidget);
    expect(find.text('Room - 102'), findsOneWidget);
    expect(find.text('Declined'), findsOneWidget);

    // Tap on the "Declined" leave to navigate to ApproveDennyLeaveScreen
    await tester.tap(find.text('Jane Smith'));
    await tester.pumpAndSettle();

    // Verify if the ApproveDennyLeaveScreen is navigated to
    expect(find.text('Approve/Denny Leave'), findsOneWidget);
  });
}
