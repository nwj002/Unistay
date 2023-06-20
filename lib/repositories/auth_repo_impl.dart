import 'package:firebase_auth/firebase_auth.dart';
import 'package:unistay/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  FirebaseAuth? _firebaseAuth;

  AuthRepoImpl() {
    _firebaseAuth = FirebaseAuth.instance;
  }
  @override
  Future<UserCredential> loginAsAdmin(
      {required String email, required String password}) async {
    final res = await _firebaseAuth!
        .signInWithEmailAndPassword(email: email, password: password);
    return res;
  }

  @override
  Future forgotPassword({required String email}) async {
    final res = await _firebaseAuth!.sendPasswordResetEmail(email: email);
    return res;
  }
}
