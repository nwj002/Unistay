import 'package:flutter/material.dart';
import 'package:unistay/size_config.dart';
import 'package:unistay/splash/components/body.dart';


class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(

      body: Body(),
    );
  }
}
