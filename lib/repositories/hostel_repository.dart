import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/hostel.dart';

class HostelRepository {
  final CollectionReference hostelsCollection =
  FirebaseFirestore.instance.collection('hostels');

  Future<void> addHostel(Hostel hostel) async {
    try {
      await hostelsCollection.add({
        'name': hostel.name,
        'address': hostel.address,
        'capacity': hostel.capacity,
      });
      print('Hostel saved to Firestore successfully');
    } catch (error) {
      print('Error saving hostel to Firestore: $error');
    }
  }
}
