import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:unistay/models/EditPersonalDetails_model.dart';
import '../viewmodels/editpersonaldetails_viewmodel.dart';


class EditPersonalDetails extends StatefulWidget {
  @override
  _EditPersonalDetailsState createState() => _EditPersonalDetailsState();

}

class _EditPersonalDetailsState extends State<EditPersonalDetails> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final EditPersonalDetailsViewModel _editPersonalDetails = EditPersonalDetailsViewModel();
  bool _isSaving = false;
  File? pickedImage;

  void _submitForm(BuildContext context) async {
    final String name = _nameController.text;
    final String phone = _phoneController.text;
    final String location = _locationController.text;


    if (name.isNotEmpty &&
        phone.isNotEmpty &&
        location.isNotEmpty &&

        pickedImage != null) {
      final EditPersonalDetailsModel personalDetailsModel = EditPersonalDetailsModel(
          name: name, phone: phone, location: location, imageUrl: '');
      setState(() {
        _isSaving = true;
      });

      try {
        await _editPersonalDetails.editDetails(personalDetailsModel, pickedImage!);

        // Clear input fields
        _nameController.clear();
        _phoneController.clear();
        _locationController.clear();

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Details saved successfully.'),
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
            content: Text('Please fill in all the fields and select an image.'),
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
          'Edit Personal Details',
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
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: ElevatedButton.icon(
                  onPressed: () => imagePickerOption(),
                  icon: const Icon(Icons.add_a_photo_sharp),
                  label: const Text('Personal Image'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: ' Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _locationController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Location',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
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







