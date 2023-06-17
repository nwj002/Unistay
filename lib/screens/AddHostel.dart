import 'package:flutter/material.dart';
import '../models/hostel.dart';
import '../viewmodels/hostel_view_model.dart';

class AddHostel extends StatefulWidget {
  const AddHostel({Key? key}) : super(key: key);

  @override
  State<AddHostel> createState() => _AddHostelState();
}

class _AddHostelState extends State<AddHostel> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();

  late final HostelViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HostelViewModel();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  void _saveHostel() {
    if (_formKey.currentState!.validate()) {
      final String name = _nameController.text;
      final String address = _addressController.text;
      final int capacity = int.tryParse(_capacityController.text) ?? 0;

      final Hostel hostel = Hostel(name: name, address: address, capacity: capacity);
      _viewModel.addHostel(hostel);

      _nameController.clear();
      _addressController.clear();
      _capacityController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Hostel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the hostel name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the hostel address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _capacityController,
                decoration: const InputDecoration(labelText: 'Capacity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the hostel capacity';
                  }
                  final int? capacity = int.tryParse(value);
                  if (capacity == null || capacity <= 0) {
                    return 'Please enter a valid capacity';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _saveHostel,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
