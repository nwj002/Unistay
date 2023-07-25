import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unistay/logic/modules/staff_model.dart';
import 'package:unistay/logic/services/fireStoreServices/staff_firestore.dart';


class StaffViewModel extends ChangeNotifier {
  final StaffRepository _repository = StaffRepository();

//location of collection of firestore
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
