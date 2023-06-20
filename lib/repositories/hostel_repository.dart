import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/hostel.dart';

class HostelRepository {
  final CollectionReference _hostelsCollection =
      FirebaseFirestore.instance.collection('hostels');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> addHostel(Hostel hostel, File imageFile) async {
    final String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageRef =
        _storage.ref().child('hostel_images/$imageName');

    // Upload image to Firebase Storage
    final TaskSnapshot storageTask = await storageRef.putFile(imageFile);
    final imageUrl = await storageTask.ref.getDownloadURL();

    // Save hostel data to Firestore
    await _hostelsCollection.add({
      'name': hostel.name,
      'address': hostel.address,
      'capacity': hostel.capacity,
      'imageUrl': imageUrl,
    });
  }
}
