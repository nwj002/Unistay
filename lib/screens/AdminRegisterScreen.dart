import 'package:flutter/material.dart';
import 'package:unistay/screens/add_rooms_screen.dart';

import '../models/admin_model.dart';
import '../viewmodels/admin_view_model.dart';

class AdminRegisterScreen extends StatefulWidget {
  const AdminRegisterScreen({Key? key}) : super(key: key);

  @override
  State<AdminRegisterScreen> createState() => _AdminRegisterScreenState();
}

class _AdminRegisterScreenState extends State<AdminRegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  bool _obscureTextPassword = true;
  bool _obscureTextPasswordConfirm = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _emailKey = GlobalKey();
  final GlobalKey<FormFieldState<String>> _phoneKey = GlobalKey();
  final GlobalKey<FormFieldState<String>> _passwordKey = GlobalKey();
  final GlobalKey<FormFieldState<String>> _confirmPasswordKey = GlobalKey();
  final GlobalKey<FormFieldState<String>> _locationKey = GlobalKey();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhone(String? value) {
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
  }

  String? validatePassword(String? value) {
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
  }

  String? validateConfirmPassword(String? value) {
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
  }

  String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Location is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final adminViewModel = AdminRegisterViewModel();

    void register() {
      if (_formKey.currentState!.validate()) {
        final admin = Admin(
          email: _emailController.text,
          phone: _phoneController.text,
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
          location: _locationController.text,
        );
        adminViewModel.register(admin, context);
      }
    }

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

              Container(
                height: 698,
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
                      SizedBox(height: 10),
                      TextFormField(
                        key: _emailKey,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
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
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                            size: 22.0,
                          ),
                        ),
=======
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30),
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
                  Container(
                    height: 698,
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
                          SizedBox(height: 10),
                          TextFormField(
                            key: Key("email_text_field"),
                            // key: _emailKey,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
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
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                                size: 22.0,
                              ),
                            ),
                          ),
                          Text('Phone Number', textAlign: TextAlign.left),
                          SizedBox(height: 10),
                          TextFormField(
                            key: Key('email_text_field'),
                            // key: _phoneKey,
                            controller: _phoneController,
                            validator: validatePhone,
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
                              prefixIcon: Icon(
                                Icons.phone,
                                size: 22.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text('Password', textAlign: TextAlign.left),
                          SizedBox(height: 10),
                          TextFormField(
                            key: Key("password_text_field"),
                            // key: _passwordKey,
                            controller: _passwordController,
                            obscureText: _obscureTextPassword,
                            validator: validatePassword,
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
                              prefixIcon: Icon(
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
                          SizedBox(height: 10),
                          TextFormField(
                            key: Key("confirm_password_text_field"),
                            // key: _confirmPasswordKey,
                            controller: _confirmPasswordController,
                            obscureText: _obscureTextPasswordConfirm,
                            validator: validateConfirmPassword,
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
                              prefixIcon: Icon(
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
                          Text('Location', textAlign: TextAlign.left),
                          SizedBox(height: 10),
                          TextFormField(
                            key: _locationKey,
                            controller: _locationController,
                            validator: validateLocation,
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
                              prefixIcon: Icon(
                                Icons.location_on,
                                size: 22.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
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
                                  ),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(vertical: 20),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, "/add-rooms");
                                // Navigator.push(context,MaterialPageRoute(builder: (kehtxt)=>AddRoomsScreen()));
                                register();
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
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
                                  ),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(vertical: 20),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Sign Up with Google",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
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

//             children: [
//               TextFormField(
//                 key: _emailKey,
//                 controller: _emailController,
//                 validator: validateEmail,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//               ),
//               TextFormField(
//                 key: _phoneKey,
//                 controller: _phoneController,
//                 validator: validatePhone,
//                 decoration: InputDecoration(
//                   labelText: 'Phone',
//                 ),
//               ),
//               TextFormField(
//                 key: _passwordKey,
//                 controller: _passwordController,
//                 validator: validatePassword,
//                 obscureText: _obscureTextPassword,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   suffixIcon: IconButton(
//                     icon: Icon(_obscureTextPassword
//                         ? Icons.visibility_off
//                         : Icons.visibility),
//                     onPressed: () {
//                       setState(() {
//                         _obscureTextPassword = !_obscureTextPassword;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               TextFormField(
//                 key: _confirmPasswordKey,
//                 controller: _confirmPasswordController,
//                 validator: validateConfirmPassword,
//                 obscureText: _obscureTextPasswordConfirm,
//                 decoration: InputDecoration(
//                   labelText: 'Confirm Password',
//                   suffixIcon: IconButton(
//                     icon: Icon(_obscureTextPasswordConfirm
//                         ? Icons.visibility_off
//                         : Icons.visibility),
//                     onPressed: () {
//                       setState(() {
//                         _obscureTextPasswordConfirm =
//                         !_obscureTextPasswordConfirm;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               TextFormField(
//                 key: _locationKey,
//                 controller: _locationController,
//                 validator: validateLocation,
//                 decoration: InputDecoration(
//                   labelText: 'Location',
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: register,
//                 child: Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
