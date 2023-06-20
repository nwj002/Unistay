import 'package:firebase_auth/firebase_auth.dart';

import '../models/admin_model.dart';

class AdminRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> register(Admin admin) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: admin.email,
        password: admin.password,
      );
    } on FirebaseAuthException catch (err) {
      throw err;
    }
  }
}
