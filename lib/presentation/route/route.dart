import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unistay/presentation/screen/auth/registration_screen.dart';

import 'package:unistay/core/constant/string.dart';
import 'package:unistay/presentation/screen/admin/Drawer/addStaffDetails.dart';
import 'package:unistay/presentation/screen/auth/forgotpasswordScreen.dart';
import 'package:unistay/presentation/screen/auth/loginScreen.dart';

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

      case forgotPasswordScreenRoute:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());


      case addStaffDetailsScreenRoute:
        return MaterialPageRoute(builder: (context) => AddStaffDetails());
        
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
