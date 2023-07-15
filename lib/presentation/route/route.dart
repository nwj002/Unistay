import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constant/string.dart';
import '../screen/admin/notice/add_notice_screen.dart';
import '../screen/auth/logInScreen.dart';
import '../screen/auth/registrationScreen.dart';
import '../screen/student/Drawer/updatePassword.dart';

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


      case updatepasswordRoute:
        return MaterialPageRoute(builder: (context) => UpdatePasswordScreen());
      case addNoticeScreenRoute:
        return MaterialPageRoute(builder: (context) => AddNoticeScreen());


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
