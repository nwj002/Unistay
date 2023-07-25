import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unistay/core/constant/string.dart';
import 'package:unistay/presentation/screen/admin/admindetilaspage/admindetails.dart';
import 'package:unistay/presentation/screen/admin/notice/add_notice_screen.dart';
import 'package:unistay/presentation/screen/auth/forgotpasswordScreen.dart';
import 'package:unistay/presentation/screen/auth/registrationScreen.dart';
import 'package:unistay/presentation/screen/splashscreen.dart';
import 'package:unistay/presentation/screen/student/Drawer/diciplinary_act.dart';
import 'package:unistay/presentation/screen/student/Drawer/helpscreen.dart';
import 'package:unistay/presentation/screen/student/Drawer/privacypolicy.dart';
import 'package:unistay/presentation/screen/admin/Drawer/addStaffDetails.dart';
import 'package:unistay/presentation/screen/admin/Drawer/staffDetails.dart';
import 'package:unistay/presentation/screen/admin/adminDashboard.dart';
import 'package:unistay/presentation/screen/auth/logInScreen.dart';
import 'package:unistay/presentation/screen/onBoardingScreen.dart';
import 'package:unistay/presentation/screen/student/detailspage/studentdetails.dart';
import 'package:unistay/presentation/screen/student/leave/studentAddLeave.dart';
import 'package:unistay/presentation/screen/student/services/bathroomServices.dart';
import 'package:unistay/presentation/screen/student/services/messService.dart';
import 'package:unistay/presentation/screen/student/services/otherServices.dart';
import 'package:unistay/presentation/screen/student/services/roomServices.dart';
import 'package:unistay/presentation/screen/student/services/studentElectricServices.dart';
import 'package:unistay/presentation/screen/student/studentDashboard.dart';


class Routes {
  late int initScreen;
  Future<void> checkForOnBordScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initScreen = prefs.getInt("initScreen")!;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen1());

      case onboardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());

      case logInScreenRoute:
        return MaterialPageRoute (builder: (context) => LogInScreen());

      case forgotPasswordScreenRoute:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());

      case registrationScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen());

      case adminDashbordScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const AdminDashbordScreen());

      case studentDashboardScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentDashboardScreen());

      case studentDetailScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentDetailScreen());

      case addNoticeScreenRoute:
        return MaterialPageRoute(builder: (context) => AddNoticeScreen());

      case helpscreenRoute:
        return MaterialPageRoute(builder: (context) => const HelpScreen());

      case disciplinaryRoute:
        return MaterialPageRoute(builder: (context) => const Disciplinary());
      case privacyRoute:
        return MaterialPageRoute(builder: (context) =>  PrivacyPolicyPage());

      case studentElectricityServiceRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentElectricityServices());

      case studentRoomServiceRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentRoomServices());

      case studentMessServiceRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentMessServices());

      case studentBathRoomServiceRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentBathroomServices());

      case studentOtherServiceRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentOtherServices());

      case addStaffDetailsScreenRoute:
        return MaterialPageRoute(builder: (context) => AddStaffDetails());

      case staffDetailsScreenRoute:
        return MaterialPageRoute(builder: (context) => StaffDetails());

      case adminDetailsScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const AdminDetailsScreen());

      case studentLeaveScreenRoute:
        return MaterialPageRoute(builder: (context) => const StudentAddLeave());

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
