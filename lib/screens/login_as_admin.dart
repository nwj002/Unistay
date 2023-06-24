import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Dashboard.dart';
import 'RegisterScreen.dart';
import 'forgot_password_screen.dart';

class LoginAsAdminScreen extends StatefulWidget {
  const LoginAsAdminScreen({Key? key}) : super(key: key);

  @override
  _LoginAsAdminScreenState createState() => _LoginAsAdminScreenState();
}

class _LoginAsAdminScreenState extends State<LoginAsAdminScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  Future<bool> _checkIfUserIsRegistered(String email) async {
    // Implement your logic to check if the user is registered in your system
    // Return true if registered, false otherwise
    // You can use Firebase Firestore or any other database to perform this check
    // Example implementation:
    // final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: email).get();
    // return snapshot.docs.isNotEmpty;
    return false;
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          // User logged in with Google successfully
          // Check if the user is registered in your system
          bool isRegistered = await _checkIfUserIsRegistered(user.email!);

          if (isRegistered) {
            // User is registered, navigate to the dashboard screen or perform further operations here
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Dashboard()),
            );
          } else {
            // User is not registered, show an error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('No account found for this email. Please register first.')),
            );
          }
        }
      }
    } catch (e) {
      print('Error occurred during Google Sign-In: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.deepOrangeAccent.shade100,
                  Colors.orange.shade300,
                  Colors.orange.shade300,
                  Colors.orange.shade100,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Sign In As Admin",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "We are delighted to see you again - Sign in",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 698,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 220,
                        child: Form(
                          key: _formKey,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: emailCtrl,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Email is required";
                                    }
                                    if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return "Enter a valid email";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
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
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                      size: 22.0,
                                    ),
                                    hintText: 'Email Address',
                                    hintStyle: TextStyle(
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: passwordCtrl,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password is required";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
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
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      size: 22.0,
                                      color: Colors.black,
                                    ),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          height: 70,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.orange.shade300),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Colors.orange.shade300),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(vertical: 20),
                              ),
                            ),
                            onPressed: () async {
                              String email = emailCtrl.text.trim();
                              String pass = passwordCtrl.text.trim();

                              if (_formKey.currentState!.validate()) {
                                // Perform regular email/password authentication here
                                // You can use Firebase Authentication or your preferred authentication method
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Please enter valid credentials')),
                                );
                              }
                            },
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => ForgotPasswordScreen()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.orange.shade300,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Or",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: _handleGoogleSignIn,
                        icon: Image.asset(
                          'assets/google_logo.png',
                          height: 20,
                          width: 20,
                        ),
                        label: Text('Sign In with Google'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.grey.shade400),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => RegisterScreen()),
                          );
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
