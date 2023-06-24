// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import '../models/docs.dart';
//
// class DocumentRepository {
//   final CollectionReference _documentCollection =
//   FirebaseFirestore.instance.collection('documents');
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   Future<void> addDocument(Docs docs, File imageFile) async {
//     final String imageName = DateTime.now().millisecondsSinceEpoch.toString();
//     final Reference storageRef =
//     _storage.ref().child('document_images/$imageName');
//
//     // Upload image to Firebase Storage
//     final TaskSnapshot storageTask = await storageRef.putFile(imageFile);
//     final imageUrl = await storageTask.ref.getDownloadURL();
//
//     // Save docs data to Firestore
//     await _documentCollection.add({
//       'imageUrl': imageUrl,
//     });
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:unistay/models/documents_model.dart';


class DocumentRepository {
  final CollectionReference _documentdetails =
  FirebaseFirestore.instance.collection('documentdetails');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> uploadDocuments(DocumentModel documentDetails, File imageFile) async {
    final String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageRef =
    _storage.ref().child('document_images/$imageName');

    // Upload image to Firebase Storage
    final TaskSnapshot storageTask = await storageRef.putFile(imageFile);
    final imageUrl = await storageTask.ref.getDownloadURL();


    await _documentdetails.add({
      'imageUrl': imageUrl,
    });
  }
}
