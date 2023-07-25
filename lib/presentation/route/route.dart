import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unistay/presentation/screen/auth/registration_screen.dart';
import 'package:unistay/presentation/screen/student/Drawer/privacypolicy.dart';


import '../../core/constant/string.dart';
import '../screen/admin/notice/add_notice_screen.dart';
import '../screen/auth/logInScreen.dart';
import '../screen/auth/registrationScreen.dart';
import '../screen/student/Drawer/helpscreen.dart';
import '../screen/student/Drawer/privacypolicy.dart';

import '../screen/student/leave/studentAddLeave.dart';


import 'package:unistay/core/constant/string.dart';
import 'package:unistay/presentation/screen/admin/Drawer/addStaffDetails.dart';
import 'package:unistay/presentation/screen/admin/Drawer/staffDetails.dart';
import 'package:unistay/presentation/screen/admin/adminDashboard.dart';

import 'package:unistay/presentation/screen/auth/loginScreen.dart';
import 'package:unistay/presentation/screen/onBoardingScreen.dart';
import 'package:unistay/presentation/screen/student/detailspage/studentdetails.dart';

import '../screen/student/studentDashboard.dart';




//routes



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



      // case updatepasswordRoute:
      //   return MaterialPageRoute(builder: (context) => UpdatePasswordScreen());


      case studentLeaveScreenRoute:
        return MaterialPageRoute(builder: (context) => const StudentAddLeave());
      case privacyRoute:
        return MaterialPageRoute(builder: (context) =>  PrivacyPolicyPage());
      case helpscreenRoute:
        return MaterialPageRoute(builder: (context) => const HelpScreen());

      case adminDashbordScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const AdminDashbordScreen());

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
