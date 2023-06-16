import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController= TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscureTextPassword = true;
  bool _obscureTextPasswordConfirm = true;

  String _uid = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  void register() async {
    try {
      if (_formKey.currentState!.validate()) {
        final user=await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
        // Form validation passed, show success Snackbar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered!")));
        // _scaffoldMessengerKey.currentState!.showSnackBar(
        //   SnackBar(
        //     content: Text('Registered'),
        //   ),
        // );

        //
      };
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.message.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.deepOrangeAccent.shade100,
                  Colors.orange.shade300,
                  Colors.orange.shade200,
                  Colors.orange.shade100,
                ]),
              ),

              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  SizedBox(height:74),
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
                      "Sign up to exlore exciting details",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(height:620,
                    decoration: BoxDecoration(
                      color: Colors.white70,
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
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
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
                          SizedBox(height: 10,),
                          TextFormField(
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
                          SizedBox(height: 10,),
                          TextFormField(
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
                                    _obscureTextPassword = !_obscureTextPassword;
                                  });
                                },
                                child: Icon(
                                  _obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                                  size: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),

                          Text('Confirm Password', textAlign: TextAlign.left),
                          SizedBox(height: 10,),
                          TextFormField(
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
                                    _obscureTextPasswordConfirm = !_obscureTextPasswordConfirm;
                                  });
                                },
                                child: Icon(
                                  _obscureTextPasswordConfirm ? Icons.visibility : Icons.visibility_off,
                                  size: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),
                          Container(
                            width:double.infinity,
                            child: ElevatedButton(

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade300),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),

                                        side: BorderSide(color: Colors.orange.shade300),
                                      )
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20)),
                                ),
                                onPressed: (){
                                  register();
                                }, child: Text("Sign Up", style: TextStyle(
                                fontSize: 20
                            ),)),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width:double.infinity,
                            child: ElevatedButton(

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade300),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),

                                        side: BorderSide(color: Colors.orange.shade300),


                                      )
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20)),
                                ),
                                onPressed: (){
                                }, child: Text("Google", style: TextStyle(
                                fontSize: 20
                            ),)),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? ", style: TextStyle(
                                  color: Colors.grey.shade800
                              ),),
                              InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Sign in", style: TextStyle(color: Colors.blue),))
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
    );
  }
}