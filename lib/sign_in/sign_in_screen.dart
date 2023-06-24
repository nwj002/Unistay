import 'package:flutter/material.dart';
import 'package:unistay/size_config.dart';

import '../sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      
      body: const Body(),
    );
  }
}
