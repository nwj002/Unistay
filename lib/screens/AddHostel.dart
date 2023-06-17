import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/hostel.dart';
import '../viewmodels/hostel_view_model.dart';

class AddHostel extends StatefulWidget {
  @override
  _AddHostelState createState() => _AddHostelState();
}

class _AddHostelState extends State<AddHostel> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final HostelViewModel _hostelViewModel = HostelViewModel();
  bool _isSaving = false;

  void _submitForm(BuildContext context) {
    final String name = _nameController.text;
    final String address = _addressController.text;
    final int capacity = int.tryParse(_capacityController.text) ?? 0;

    if (name.isNotEmpty && address.isNotEmpty && capacity > 0) {
      final Hostel hostel = Hostel(name: name, address: address, capacity: capacity);
      setState(() {
        _isSaving = true;
      });

      _saveHostelToFirestore(hostel).then((_) {
        // Clear input fields
        _nameController.clear();
        _addressController.clear();
        _capacityController.clear();

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Hostel saved successfully.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    setState(() {
                      _isSaving = false; // Reset the saving state
                    });
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }).catchError((error) {
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
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Invalid Data'),
            content: Text('Please fill in all the fields with valid data.'),
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

  Future<void> _saveHostelToFirestore(Hostel hostel) async {
    try {
      final CollectionReference hostelsCollection = FirebaseFirestore.instance.collection('hostels');
      await hostelsCollection.add({
        'name': hostel.name,
        'address': hostel.address,
        'capacity': hostel.capacity,
      });
      print('Hostel saved to Firestore successfully');
    } catch (error) {
      print('Error saving hostel to Firestore: $error');
      throw error; // Propagate the error to the caller
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
      ),
      body: Container(
        color: Colors.orange.shade100,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Hostel',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
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
              controller: _capacityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Capacity',
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
              child: _isSaving ? CircularProgressIndicator() : Text('Add'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
