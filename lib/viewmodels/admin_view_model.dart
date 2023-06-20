
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/admin_model.dart';
import '../repositories/admin_repository.dart';

class AdminRegisterViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository = AdminRepository();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKeyRegister =
  GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKeySnackBar =
  GlobalKey<ScaffoldMessengerState>();

  void register(Admin admin, BuildContext context) async {
    try {
      await _adminRepository.register(admin);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registered!"),
        ),
      );
      _scaffoldMessengerKeyRegister.currentState!.showSnackBar(
        SnackBar(
          content: Text('Registered'),
        ),
      );
      Navigator.of(context).pushNamed("/AddRooms");
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
