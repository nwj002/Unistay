import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/hostel.dart';

class HostelRepository {
  final CollectionReference hostelCollection =
  FirebaseFirestore.instance.collection('hostels');

  Future<void> addHostel(Hostel hostel) async {
    try {
      await hostelCollection.add(hostel.toJson());
    } catch (e) {
      // Handle any errors here
      print('Error adding hostel: $e');
      rethrow;
    }
  }
}
