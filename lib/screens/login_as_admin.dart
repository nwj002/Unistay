import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unistay/screens/RegisterScreen.dart';
import 'package:unistay/screens/forgot_password_screen.dart';
import 'package:unistay/viewmodels/auth_provider_viewmodel.dart';

class LoginAsAdminScreen extends StatefulWidget {
  const LoginAsAdminScreen({Key? key}) : super(key: key);

  @override
  _LoginAsAdminScreenState createState() => _LoginAsAdminScreenState();
}

class _LoginAsAdminScreenState extends State<LoginAsAdminScreen> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
   

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const SizedBox(height: 30,),
                 const Padding(
                    padding:  EdgeInsets.all(12.0),
                    child: Text(
                      "Sign In As Admin",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
               const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(
                    "We are delighted to see you again - Sign in",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
               const SizedBox(height: 15),
                Container(
                  height: 698,
                  decoration:const BoxDecoration(
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
                            padding:const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                              const  SizedBox(height: 20),
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
                                  style:const TextStyle(
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
                                    prefixIcon:const Icon(
                                      Icons.email,
                                      color: Colors.black,
                                      size: 22.0,
                                    ),
                                    hintText: 'Email Address',
                                    hintStyle:const TextStyle(
                                      
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ),
                               const SizedBox(height: 20),
                                TextFormField(
                                  controller: passwordCtrl,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password is required";
                                    }
                                    return null;
                                  },
                                  style:const TextStyle(
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
                                    prefixIcon:const Icon(
                                      Icons.lock,
                                      size: 22.0,
                                      color: Colors.black,
                                    ),
                                    hintText: 'Password',
                                    hintStyle:const TextStyle(
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
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.orange.shade300),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
                                  final res = await context
                                      .read<AuthProvider>()
                                      .loginAsAdmin(email: email, password: pass);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Logged In As Admin!")));
                                  if (res == "OK") {
                                    // Handle success
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(content: Text(res)));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Please enter all the details")),
                                  );
                                }
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                                                 ),
                         ),
                      
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              letterSpacing: 1,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'Assets/Images/google.png',
                                      height: 30,
                                      width: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Google",
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New Here? ",
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              height: 1,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                      SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => RegisterScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Create an account",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
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
