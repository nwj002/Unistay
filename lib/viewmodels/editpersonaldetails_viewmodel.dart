// import 'dart:io';
// import 'package:flutter/material.dart';
// import '../models/EditPersonalDetails_model.dart';
// import '../repositories/edit_personal_details_repository.dart';
//
//
// class EditPersonalDetailsViewModel extends ChangeNotifier {
//   final EditPersonalDetailsRepository _repository = EditPersonalDetailsRepository();
//
//   Future<void> editDetails(EditPersonalDetailsModel personalDetails, File imageFile) async {
//     try {
//       await _repository.editDetails(personalDetails, imageFile);
//       // Add any additional logic or error handling if required
//     } catch (error) {
//       // Handle the error
//       throw error;
//     }
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import '../models/EditPersonalDetails_model.dart';
import '../repositories/edit_personal_details_repository.dart';

class EditPersonalDetailsViewModel extends ChangeNotifier {
  final EditPersonalDetailsRepository _repository = EditPersonalDetailsRepository();

  Future<void> editDetails(EditPersonalDetailsModel personalDetails, File imageFile) async {
    try {
      await _repository.editDetails(personalDetails, imageFile);
      // Add any additional logic or error handling if required
    } catch (error) {
      // Handle the error
      throw error;
    }
  }
}

