import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class HostelRepository {
  Future<String> uploadImage(File imageFile) async {
    try {
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final firebase_storage.Reference storageReference =
      firebase_storage.FirebaseStorage.instance.ref().child('hostel_images/$fileName');
      final firebase_storage.UploadTask uploadTask = storageReference.putFile(imageFile);
      final firebase_storage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await taskSnapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (error) {
      print('Error uploading image to Firebase Storage: $error');
      throw error;
    }
  }
}
