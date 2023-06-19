import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/hostel.dart';
import '../repositories/hostel_repository.dart';

class HostelViewModel extends ChangeNotifier {
  final HostelRepository _repository = HostelRepository();

  Future<void> addHostel(Hostel hostel, File imageFile) async {
    try {
      await _repository.addHostel(hostel, imageFile);
      // Add any additional logic or error handling if required
    } catch (error) {
      // Handle the error
      throw error;
    }
  }
}
