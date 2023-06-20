import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomRepository {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addRoom(String roomName, int capacity) async {
    try {
      User? currentUser = _firebaseAuth.currentUser;
      if (currentUser == null) {
        throw Exception('User not signed in.');
      }

      await _firestore.collection('rooms').add({
        'roomName': roomName,
        'capacity': capacity,
        'userId': currentUser.uid,
      });
    } catch (e) {
      throw Exception('Error adding room: $e');
    }
  }
}
