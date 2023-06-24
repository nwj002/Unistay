// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:unistay/models/docs.dart';
//
// import '../repositories/document_repository.dart';
//
// class DocumentViewModel extends ChangeNotifier {
//   final DocumentRepository _repository = DocumentRepository();
//
//   Future<void> addDocs(Docs docs, File imageFile) async {
//     try {
//       await _repository.addDocument(Docs as Docs, imageFile);
//       // Add any additional logic or error handling if required
//     } catch (error) {
//       // Handle the error
//       throw error;
//     }
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import '../models/documents_model.dart';
import '../repositories/document_repository.dart';


class DocumentViewModel extends ChangeNotifier {
  final DocumentRepository _repository = DocumentRepository();

  Future<void> uploadDocuments(DocumentModel documentDetails, File imageFile) async {
    try {
      await _repository.uploadDocuments(documentDetails, imageFile);
      // Add any additional logic or error handling if required
    } catch (error) {
      // Handle the error
      throw error;
    }
  }
}


