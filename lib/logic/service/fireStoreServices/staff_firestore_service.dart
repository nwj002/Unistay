import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hostelapplication/logic/modules/staff_model.dart';



class StaffRepository {
  final CollectionReference _staffsCollection =
      FirebaseFirestore.instance.collection('staffs');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> addstaff(Staff staff, File imageFile) async {
    final String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageRef =
        _storage.ref().child('staff_images/$imageName');

    // Upload image to Firebase Storage
    final TaskSnapshot storageTask = await storageRef.putFile(imageFile);
    final imageUrl = await storageTask.ref.getDownloadURL();

    // Save hostel data to Firestore
    await _staffsCollection.add({
      'name': staff.name,
      'address': staff.address,
      'department': staff.department,
      'phonenumber':staff.phonenumber,
      'imageUrl': imageUrl,
    });
  }
}
