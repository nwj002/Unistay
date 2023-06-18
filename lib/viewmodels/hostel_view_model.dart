import 'dart:io';
import '../repositories/hostel_repository.dart';
import '../models/hostel.dart';

class HostelViewModel {
  final HostelRepository _hostelRepository = HostelRepository();

  Future<void> addHostel(Hostel hostel, File imageFile) async {
    try {
      final imageUrl = await _hostelRepository.uploadImage(imageFile);
      final hostelWithImage = hostel.copyWith(imageUrl: imageUrl);
      // Save hostel data to Firestore or perform other operations
      print('Hostel with image: $hostelWithImage');
    } catch (error) {
      print('Error adding hostel with image: $error');
      throw error;
    }
  }
}
