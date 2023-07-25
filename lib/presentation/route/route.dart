import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unistay/presentation/screen/auth/registration_screen.dart';

import '../../core/constant/string.dart';
import '../screen/auth/logInScreen.dart';
import '../screen/auth/registrationScreen.dart';
import '../screen/student/Drawer/privacypolicy.dart';

import '../screen/student/leave/studentAddLeave.dart';

class Routes {
  late int initScreen;
  Future<void> checkForOnBordScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initScreen = prefs.getInt("initScreen")!;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case logInScreenRoute:
        return MaterialPageRoute(builder: (context) => LogInScreen());
      case registrationScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen());

      case registrationScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen());

      case updatepasswordRoute:
        return MaterialPageRoute(builder: (context) => UpdatePasswordScreen());

      case studentLeaveScreenRoute:
        return MaterialPageRoute(builder: (context) => const StudentAddLeave());
      case privacyRoute:
        return MaterialPageRoute(builder: (context) =>  PrivacyPolicyPage());
      case helpscreenRoute:
        return MaterialPageRoute(builder: (context) => const HelpScreen());



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
