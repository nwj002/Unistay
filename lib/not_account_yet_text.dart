import 'package:flutter/material.dart';
import 'package:unistay/constants.dart';
import '../size_config.dart';

class NotAccountYetText extends StatelessWidget {
  const NotAccountYetText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: getProportionateScreenWidth(18)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/register"),
          child: Text(
            "Sign Up",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}
