import 'package:flutter/material.dart';
import '../models/google_auth_model.dart';
import '../repositories/google_auth_repository.dart';

class GoogleAuthViewModel extends ChangeNotifier {
  final GoogleAuthRepository _repository = GoogleAuthRepository();

  Future<GoogleAuthModel?> signInWithGoogle() async {
    final authModel = await _repository.signInWithGoogle();
    return authModel;
  }

  Future<bool> isGoogleAccountRegistered(String email) async {
    final isRegistered = await _repository.isGoogleAccountRegistered(email);
    return isRegistered;
  }
}
