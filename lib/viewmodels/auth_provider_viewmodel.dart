import 'package:flutter/cupertino.dart';
import 'package:unistay/repositories/auth_repo_impl.dart';

class AuthProvider with ChangeNotifier {
  AuthRepoImpl? _repo;

  AuthProvider() {
    _repo = AuthRepoImpl();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _loadingText = "Please wait..";
  String get loadingText => _loadingText;

  Future<String> loginAsAdmin({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _loadingText = "Logging in..";
    notifyListeners();
    String result = "OK";

    try {
      final res = await _repo!.loginAsAdmin(email: email, password: password);
      print(res);
    } catch (e) {
      print(e);
      result = e.toString();
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }

  Future<String> forgotPassword({required String email}) async {
    _isLoading = true;
    _loadingText = "Please wait..";

    notifyListeners();
    String result = "OK";

    try {
      final res = await _repo!.forgotPassword(
        email: email,
      );
      print(res);
    } catch (e) {
      result = e.toString();
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }
}
