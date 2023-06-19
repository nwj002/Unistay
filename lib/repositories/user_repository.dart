//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import '../models/user_model.dart';
//
// class UserRepository {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<UserModel?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//       await _googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuth =
//         await googleSignInAccount.authentication;
//
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuth.accessToken,
//           idToken: googleSignInAuth.idToken,
//         );
//
//         final UserCredential userCredential =
//         await _auth.signInWithCredential(credential);
//         final User? user = userCredential.user;
//
//         if (user != null) {
//           final UserModel? userModel = await _getUserByEmail(user.email);
//           if (userModel != null) {
//             return userModel;
//           } else {
//             // Save user data in Firestore
//             await _saveUserData(
//               user.uid,
//               user.displayName ?? '',
//               user.email ?? '',
//               user.photoURL ?? '',
//             );
//
//             return UserModel(
//               uid: user.uid,
//               name: user.displayName ?? '',
//               email: user.email ?? '',
//               photoUrl: user.photoURL ?? '',
//             );
//           }
//         }
//       }
//     } catch (e) {
//       print('Error signing in with Google: $e');
//     }
//     return null;
//   }
//
//   Future<UserModel?> _getUserByEmail(String email) async {
//     final QuerySnapshot snapshot = await _firestore
//         .collection('users')
//         .where('email', isEqualTo: email)
//         .get();
//
//     if (snapshot.docs.isNotEmpty) {
//       final user = snapshot.docs.first.data();
//       return UserModel(
//         uid: snapshot.docs.first.id,
//         name: user['name'] ?? '',
//         email: user['email'] ?? '',
//         photoUrl: user['photoUrl'] ?? '',
//       );
//     }
//     return null;
//   }
//
//   Future<void> _saveUserData(
//       String uid, String name, String email, String photoUrl) async {
//     await _firestore.collection('users').doc(uid).set({
//       'name': name,
//       'email': email,
//       'photoUrl': photoUrl,
//     });
//   }
//
//   Future<void> signOut() async {
//     await _auth.signOut();
//     await _googleSignIn.signOut();
//   }
// }
