import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constant/string.dart';
import '../screen/auth/logInScreen.dart';
import '../screen/auth/registrationScreen.dart';

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
