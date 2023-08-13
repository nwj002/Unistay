import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/staff_model.dart';
import 'package:hostelapplication/logic/provider/staff_provider.dart';
import 'package:hostelapplication/presentation/screen/admin/Drawer/staffDetails.dart';
import 'package:hostelapplication/presentation/screen/admin/adminDashbord.dart';
import 'package:image_picker/image_picker.dart';

class AddStaffDetails extends StatefulWidget {
  @override
  _AddStaffDetailsState createState() => _AddStaffDetailsState();
}

class _AddStaffDetailsState extends State<AddStaffDetails> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final StaffViewModel _staffViewModel = StaffViewModel();
  bool _isSaving = false;
  File? pickedImage;

  void _submitForm(BuildContext context) async {
    final String name = _nameController.text;
    final String address = _addressController.text;
    final String department = _departmentController.text;
    final int phonenumber = int.tryParse(_phonenumberController.text) ?? 0;

    if (name.isNotEmpty &&
        address.isNotEmpty &&
        phonenumber > 0 &&
        pickedImage != null) {
      final Staff staff = Staff(
          name: name,
          address: address,
          department: department,
          phonenumber: phonenumber,
          imageUrl: '');
      setState(() {
        _isSaving = true;
      });

      try {
        await _staffViewModel.addStaff(staff, pickedImage!);

        // Clear input fields
        _nameController.clear();
        _addressController.clear();
        _departmentController.clear();

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Staff saved successfully.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    setState(() {
                      _isSaving = false; // Reset the saving state
                      pickedImage = null; // Clear the picked image
                    });
                  },
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StaffDetails()));
                      },
                      child: Text(
                        'OK',
                      )),
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
              content: Text('Failed to save staff details to Firestore.'),
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
      // Get.back();
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
          //changes
          'Add Hostel Staff Details',
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
                        color:
                            Colors.white10, // Use the color of the "Add" button
                      ),
                      child: ClipRect(
                          child: pickedImage != null
                              ? Image.file(
                                  pickedImage!,
                                  width: 500,
                                  height: 200,
                                  fit: BoxFit.cover,
                                )
                              : null),
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
                  label: const Text('Staff Image'), //changes
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
                key: Key("staff_name_field"),
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Staff Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                key: Key("staff_address_field"),
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                key: Key("staff_department_field"),
                controller: _departmentController,
                decoration: InputDecoration(
                  labelText: 'Department', //changes
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                key: Key("staff_phonenumber_field"),
                controller: _phonenumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
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
