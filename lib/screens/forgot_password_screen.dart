import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unistay/viewmodels/auth_provider_viewmodel.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailCtrl.text);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please check your email")));
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.message.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            // margin: EdgeInsets.only(left: 10,right: 10,),
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.deepOrangeAccent.shade100,
              Colors.orange.shade300,
              Colors.orange.shade300,
              Colors.orange.shade100,
            ])),
        
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30,),
                  
                 const  Padding(
                     padding:  EdgeInsets.all(12.0),
                     child: Text(
                       "Forgot Password",
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
                    "Reset Your Password",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                                 ),
                 ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 698,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 320,
                        child: Form(
                          key: _formkey,
                          child: Container(
                            padding:const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _emailCtrl,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (String? value) {
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
                                  style: const TextStyle(
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.black,
                                      size: 22.0,
                                    ),
                                    hintText: 'Email Address',
                                    hintStyle: const TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 17.0),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password is required";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 22.0,
                                      color: Colors.black,
                                    ),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 17.0),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password and confirm password must be same";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                      fontFamily: 'WorkSansSemiBold',
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 22.0,
                                      color: Colors.black,
                                    ),
                                    hintText: 'Confirm Password',
                                    hintStyle: const TextStyle(
                                        fontFamily: 'WorkSansSemiBold',
                                        fontSize: 17.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          height: 70,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.orange.shade300),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                          color: Colors.orange.shade200,
                                        ))),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(vertical: 20)),
                              ),
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  final res = await context
                                      .read<AuthProvider>()
                                      .forgotPassword(
                                          email: _emailCtrl.text.trim());
                                  if (res == "OK") {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Email link send to ${_emailCtrl.text.trim()} ")));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(res)));
                                  }
                                }
                                resetPassword();
                              },
                              child: const Text(
                                "Save Changes",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
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
