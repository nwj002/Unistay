import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unistay/screens/verify_screen.dart';

import '../models/RegisterUserModel.dart';
import '../viewmodels/RegisterViewModel.dart';
import 'login_as_admin.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscureTextPassword = true;
  bool _obscureTextPasswordConfirm = true;

  RegisterViewModel _registerViewModel = RegisterViewModel();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _register() async {
    if (_formKey.currentState!.validate()) {
      RegisterUserModel registerModel = RegisterUserModel(
        email: _emailController.text,
        phoneNumber: _phoneController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );

      String? errorMessage =
          await _registerViewModel.register(registerModel, context);

      if (errorMessage == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Verify()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.deepOrangeAccent.shade100,
                    Colors.orange.shade300,
                    Colors.orange.shade200,
                    Colors.orange.shade100,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 45),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Sign up to explore exciting details",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 648,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text('Email Address', textAlign: TextAlign.left),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              key: Key("email_field"),
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                }
                                final emailRegex = RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                // border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                              ),
                            ),
                            Text('Phone Number', textAlign: TextAlign.left),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              key: Key("phone_number_field"),
                              controller: _phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Phone number is required';
                                }
                                if (value.length != 10) {
                                  return 'Phone number should be 10 digits';
                                }
                                final phoneNumberRegex = RegExp(r'^[0-9]{10}$');
                                if (!phoneNumberRegex.hasMatch(value)) {
                                  return 'Please enter a valid phone number';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  size: 22.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text('Password', textAlign: TextAlign.left),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              key: Key("password_field"),
                              controller: _passwordController,
                              obscureText: _obscureTextPassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                if (value.length < 8) {
                                  return 'Password should be at least 8 characters';
                                }
                                if (_confirmPasswordController.text != value) {
                                  return 'Please make sure both passwords are the same';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  size: 22.0,
                                  color: Colors.black,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureTextPassword =
                                          !_obscureTextPassword;
                                    });
                                  },
                                  child: Icon(
                                    _obscureTextPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Text('Confirm Password', textAlign: TextAlign.left),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              key: Key("confirm_password_field"),
                              controller: _confirmPasswordController,
                              obscureText: _obscureTextPasswordConfirm,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                if (value.length < 8) {
                                  return 'Password should be at least 8 characters';
                                }
                                if (_passwordController.text != value) {
                                  return 'Please make sure both passwords are the same';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock_clock,
                                  size: 22.0,
                                  color: Colors.black,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureTextPasswordConfirm =
                                          !_obscureTextPasswordConfirm;
                                    });
                                  },
                                  child: Icon(
                                    _obscureTextPasswordConfirm
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                key: Key("signUpButton"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.orange.shade300),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: Colors.orange.shade300),
                                    )),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.symmetric(vertical: 20)),
                                  ),
                                  onPressed: () {
                                    _register();
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade300),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.orange.shade300),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20)),
                                ),
                                onPressed: () async {
                                  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

                                  if (googleUser != null) {
                                    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

                                    final AuthCredential credential = GoogleAuthProvider.credential(
                                      idToken: googleAuth.idToken,
                                      accessToken: googleAuth.accessToken,
                                    );

                                    try {
                                      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
                                      final User? user = userCredential.user;

                                      if (user != null) {
                                        // Registration successful, handle the logic accordingly
                                      } else {
                                        // Registration failed, handle the error case
                                      }
                                    } catch (e) {
                                      // Error occurred during registration, handle the error case
                                    }
                                  } else {
                                    // Google sign-in failed, handle the error case
                                  }
                                },
                                child: Text(
                                  "Google",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: TextStyle(color: Colors.grey.shade800),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginAsAdminScreen()));
                                  },
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
