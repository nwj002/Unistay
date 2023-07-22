import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../modules/updatepassword_model.dart';


class UpdatePasswordViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updatePassword(UpdatePasswordModel passwordModel) async {
    try {
      // Step 1: Re-authenticate the user with the current password
      User? user = _auth.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: passwordModel.currentPassword,
        );
        UserCredential userCredential = await user.reauthenticateWithCredential(credential);

        if (userCredential.user == null) {
          throw Exception('Reauthentication failed');
        }

        // Step 2: Update the password
        await user.updatePassword(passwordModel.newPassword);

        // Step 3: Perform necessary Firebase updates or other actions
        // Example: Update user data in Firestore
        await _firestore.collection('users').doc(user.uid).update({
          'password': passwordModel.newPassword,
        });

        print('Password updated successfully');
      } else {
        throw Exception('User not found');
      }
    } catch (error) {
      // Handle error
      print('Password update failed: $error');
    }
  }
}
