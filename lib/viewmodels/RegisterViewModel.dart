import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/RegisterUserModel.dart';

class RegisterViewModel {
  Future<String?> register(RegisterUserModel registerModel, BuildContext context) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );
      final User? user = userCredential.user;

      if (user != null) {
        // Registration success, show success Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registered!")),
        );
      }
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message.toString()),
          backgroundColor: Colors.red,
        ),
      );
      return err.message;
    }
  }
}
