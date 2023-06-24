import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/google_auth_model.dart';

class GoogleAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<GoogleAuthModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          return GoogleAuthModel(
            userId: user.uid,
            displayName: user.displayName,
            email: user.email,
          );
        }
      }

      return null;
    } catch (e) {
      print('Error occurred during Google Sign-In: $e');
      return null;
    }
  }

  Future<bool> isGoogleAccountRegistered(String email) async {
    try {
      // Implement the logic to check if the Google account is already registered in your app's database
      // You can use your own database or an API call to perform the check
      // Example: perform a GET request to your backend API to check if the email is registered
      // Make sure to handle error cases appropriately and return false in case of errors
      // You can use packages like http or Dio for making API calls
      // Example using http package:
      /*
      final response = await http.get(Uri.parse('https://your-api.com/check?email=$email'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final isRegistered = data['isRegistered'] ?? false;
        return isRegistered;
      } else {
        // Error occurred during the check, handle the error case
        return false;
      }
      */

      // Placeholder code for demo purposes
      // Assume the email is not registered
      return false;
    } catch (e) {
      print('Error occurred during Google Account Check: $e');
      return false;
    }
  }
}
