import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unistay/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  

  _login() async {

  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;

  @override
  void initState() {
    super.initState();
    // autoLogin();
  }

  // void autoLogin() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? token = sharedPreferences.getString('token');

  //   // convert userdate to string dynamic

  //   print("Token aaayena ta ke vo");
  //   print(token);
  //   if (token!.isNotEmpty) {
  //     _navigateToScreen(true);
  //   } else {
  //     _navigateToScreen(false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Row(
            children: [
              Checkbox(
                  activeColor: kPrimaryColor,
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  }),
              const Text("Accept terms and conditions"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, "/forgot_password"),
                child: const Text(
                  "Forget Password?",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(26),
          ),
          DefaultButton(
            text: "Login",
            key: const Key("Login"),
            press: () {
              if (_formKey.currentState!.validate()) {
                _login();
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      key: const ValueKey("password"),
      validator: (value) {
        if (value!.isEmpty) {
          return "Password is required";
        }
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      key: const ValueKey("email"),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Email is required";
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return "Please enter a valid email";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter Your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
