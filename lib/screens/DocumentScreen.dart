// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:get/get.dart';
// import 'package:unistay/models/docs.dart';
// import 'package:unistay/viewmodels/document_view_model.dart';
//
//
//
// class DocumentScreen extends StatefulWidget {
//   @override
//   _DocumentState createState() => _DocumentState();
// }
//
// class _DocumentState extends State<DocumentScreen> {
//   // final TextEditingController _nameController = TextEditingController();
//   // final TextEditingController _addressController = TextEditingController();
//   // final TextEditingController _capacityController = TextEditingController();
//   // final HostelViewModel _hostelViewModel = HostelViewModel();
//   final DocumentViewModel _documentViewModel=DocumentViewModel();
//   bool _isSaving = false;
//   File? pickedImage;
//
//   void _submitForm(BuildContext context) async {
//     // final String name = _nameController.text;
//     // final String address = _addressController.text;
//     // final int capacity = int.tryParse(_capacityController.text) ?? 0;
//
//     if (
//         pickedImage != null) {
//       final Docs docs = Docs(
//           imageUrl: '');
//       setState(() {
//         _isSaving = true;
//       });
//
//       try {
//         await _documentViewModel.addDocs(docs, pickedImage!);
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text('Document Saved'),
//               content: Text('Your document has been submitted sucessfully'),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context); // Close the dialog
//                     setState(() {
//                       _isSaving = false; // Reset the saving state
//                       pickedImage = null; // Clear the picked image
//                     });
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       } catch (error) {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text('Error'),
//               content: Text('Upload Failed'),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context); // Close the dialog
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Image not selected'),
//             content: Text('Please select an image.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Close the dialog
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
//
//   void imagePickerOption() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Pick Image From'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   pickImage(ImageSource.gallery);
//                   Navigator.pop(context); // Close the dialog
//                 },
//                 icon: Icon(Icons.image),
//                 label: Text("Gallery"),
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   pickImage(ImageSource.camera);
//                   Navigator.pop(context); // Close the dialog
//                 },
//                 icon: Icon(Icons.camera),
//                 label: Text("Camera"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   pickImage(ImageSource imageType) async {
//     try {
//       final photo = await ImagePicker().pickImage(source: imageType);
//       if (photo == null) return;
//       final tempImage = File(photo.path);
//       setState(() {
//         pickedImage = tempImage;
//       });
//       Get.back();
//     } catch (error) {
//       debugPrint(error.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orange.shade300,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'My Documents',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true, // Center the title horizontally
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.grey.shade100,
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment:
//             MainAxisAlignment.start, // Align elements from top to bottom
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Align(
//                 alignment:
//                 Alignment.topCenter, // Align the image to the top center
//                 child: Stack(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: Colors.orange
//                             .shade300, // Use the color of the "Add" button
//                       ),
//                       child: ClipRect(
//                         child: pickedImage != null
//                             ? Image.file(
//                           pickedImage!,
//                           width: 500,
//                           height: 200,
//                           fit: BoxFit.cover,
//                         )
//                             : Image.asset('Assets/Images/insert_image.jpg'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
//                 child: ElevatedButton.icon(
//                   onPressed: () => imagePickerOption(),
//                   icon: const Icon(Icons.add_a_photo_sharp),
//                   label: const Text('Upload Image'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.orange.shade300,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Please upload your genuine \n 'University profile' document.",
//                     style: TextStyle(
//                       color: Colors.grey.shade800,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 25,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "The document uploaded music be authentic \n for which in future might be used by hostel \n FOR VERIFICATION. ",
//                     style: TextStyle(
//                       color: Colors.grey.shade800,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "*for more hostel policy details, contact admin",
//                     style: TextStyle(
//                       color: Colors.grey.shade800,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _isSaving ? null : () => _submitForm(context),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.orange.shade300,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 10),
//                 ),
//                 child: _isSaving
//                     ? CircularProgressIndicator()
//                     : Text(
//                   'Upload',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:unistay/models/documents_model.dart';
import '../viewmodels/document_view_model.dart';


class Document extends StatefulWidget {
  @override
  _DocumentState createState() => _DocumentState();

}

class _DocumentState extends State<Document> {
  final DocumentViewModel _documentViewModel = DocumentViewModel();
  bool _isSaving = false;
  File? pickedImage;

  void _submitForm(BuildContext context) async {

    if (pickedImage != null) {
      final DocumentModel documentModel = DocumentModel(imageUrl: '');
      setState(() {
        _isSaving = true;
      });

      try {
        await _documentViewModel.uploadDocuments(documentModel, pickedImage!);
        // Clear input fields
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Document saved successfully.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    setState(() {
                      _isSaving = false; // Reset the saving state
                      pickedImage = null; // Clear the picked image
                    });
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } catch (error) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to save hostel to Firestore.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Invalid Data'),
            content: Text('Please select an image.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void imagePickerOption() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick Image From'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context); // Close the dialog
                },
                icon: Icon(Icons.image),
                label: Text("Gallery"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context); // Close the dialog
                },
                icon: Icon(Icons.camera),
                label: Text("Camera"),
              ),
            ],
          ),
        );
      },
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'My Documents',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Center the title horizontally
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade100,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.start, // Align elements from top to bottom
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment:
                Alignment.topCenter, // Align the image to the top center
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.orange
                            .shade300, // Use the color of the "Add" button
                      ),
                      child: ClipRect(
                        child: pickedImage != null
                            ? Image.file(
                          pickedImage!,
                          width: 500,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                            : Image.asset('Assets/Images/insert_image.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              SizedBox(height: 20),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: ElevatedButton.icon(
                  onPressed: () => imagePickerOption(),
                  icon: const Icon(Icons.add_a_photo_sharp),
                  label: const Text('Upload Image'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Please upload your genuine \n 'University profile' document.",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "The document uploaded music be authentic \n for which in future might be used by hostel \n FOR VERIFICATION. ",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "*for more hostel policy details, contact admin",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isSaving ? null : () => _submitForm(context),
                child: _isSaving
                    ? CircularProgressIndicator()
                    : Text(
                  'Save',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}