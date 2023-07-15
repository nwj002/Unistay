import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:unistay/core/constant/string.dart';
import 'package:unistay/presentation/screen/admin/Drawer/addStaffDetails.dart';
import 'package:unistay/presentation/screen/admin/Drawer/staffDetails.dart';
import 'package:unistay/presentation/screen/auth/forgotpasswordScreen.dart';
import 'package:unistay/presentation/screen/auth/loginScreen.dart';
import 'package:unistay/presentation/screen/student/detailspage/studentdetails.dart';

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

      case forgotPasswordScreenRoute:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());

      case studentDetailScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentDetailScreen());


      case addStaffDetailsScreenRoute:
        return MaterialPageRoute(builder: (context) => AddStaffDetails());
        

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
