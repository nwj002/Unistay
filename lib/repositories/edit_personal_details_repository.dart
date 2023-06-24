import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:unistay/models/EditPersonalDetails_model.dart';


class EditPersonalDetailsRepository {
  final CollectionReference _personaldetails =
  FirebaseFirestore.instance.collection('personaldetails');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> editDetails(EditPersonalDetailsModel personalDetails, File imageFile) async {
    final String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageRef =
    _storage.ref().child('personal_images/$imageName');

    // Upload image to Firebase Storage
    final TaskSnapshot storageTask = await storageRef.putFile(imageFile);
    final imageUrl = await storageTask.ref.getDownloadURL();


    await _personaldetails.add({
      'name': personalDetails.name,
      'address': personalDetails.phone,
      'location': personalDetails.location,
      'imageUrl': imageUrl,
    });
  }
}
