import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unistay/presentation/screen/student/Drawer/diciplinary_act.dart';
import 'package:unistay/presentation/screen/student/Drawer/privacypolicy.dart';
import 'package:unistay/presentation/screen/student/Drawer/updatePassword.dart';
import '../../core/constant/string.dart';
import '../screen/auth/logInScreen.dart';
import '../screen/admin/notice/add_notice_screen.dart';
import '../screen/auth/logInScreen.dart';

import '../screen/auth/registrationScreen.dart';
import '../screen/student/Drawer/updatePassword.dart';
import '../screen/student/leave/studentAddLeave.dart';
import 'package:unistay/core/constant/string.dart';
import 'package:unistay/presentation/screen/admin/Drawer/addStaffDetails.dart';
import 'package:unistay/presentation/screen/admin/Drawer/staffDetails.dart';
import 'package:unistay/presentation/screen/admin/adminDashboard.dart';
import 'package:unistay/presentation/screen/auth/loginScreen.dart';
import 'package:unistay/presentation/screen/onBoardingScreen.dart';
import 'package:unistay/presentation/screen/student/detailspage/studentdetails.dart';

import '../screen/student/studentDashboard.dart';






class Routes {
  late int initScreen;
  Future<void> checkForOnBordScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initScreen = prefs.getInt("initScreen")!;
  }
//generate route
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

//onboarding screen
      case onboardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());

//login screen
      case logInScreenRoute:
        return MaterialPageRoute(builder: (context) => LogInScreen());
      case registrationScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen());

        case studentDashboardScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const StudentDashboardScreen());



    case updatepasswordRoute:
        return MaterialPageRoute(builder: (context) => UpdatePasswordScreen());
      case addNoticeScreenRoute:
        return MaterialPageRoute(builder: (context) => AddNoticeScreen());

//registration
      case registrationScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen());

      // case updatepasswordRoute:
      //   return MaterialPageRoute(builder: (context) => UpdatePasswordScreen());

      case adminDashbordScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const AdminDashbordScreen());

        case disciplinaryRoute:
        return MaterialPageRoute(builder: (context) => const Disciplinary());

        case studentDetailScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentDetailScreen());

//add staff details
      case addStaffDetailsScreenRoute:
        return MaterialPageRoute(builder: (context) => AddStaffDetails());

//staff details
      case staffDetailsScreenRoute:
        return MaterialPageRoute(builder: (context) => StaffDetails());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
