import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/staff_model.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/staff_firestore_service.dart';


class StaffViewModel extends ChangeNotifier {
  final StaffRepository _repository = StaffRepository();

  Future<void> addStaff(Staff staff, File imageFile) async {
    try {
      await _repository.addstaff(staff, imageFile);
      // Add any additional logic or error handling if required
    } catch (error) {
      // Handle the error
      throw error;
    }
  }
}
