
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/add_rooms_view_model.dart';

class AddRoomsScreen extends StatelessWidget {
  final TextEditingController _roomNameController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddRoomsViewModel>(
      create: (context) => AddRoomsViewModel(),
      child: Consumer<AddRoomsViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Colors.deepOrangeAccent.shade100,
                          Colors.orange.shade300,
                          Colors.orange.shade200,
                          Colors.orange.shade100,
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "ADD ROOMS",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: 698,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 40),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: TextFormField(
                                  controller: _roomNameController,
                                  decoration: InputDecoration(
                                    labelText: 'Room Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a room name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: TextFormField(
                                  controller: _capacityController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Capacity',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the capacity';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 40),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    String roomName =
                                        _roomNameController.text;
                                    int capacity =
                                    int.parse(_capacityController.text);
                                    viewModel.addRoom(roomName, capacity);
                                  }
                                },
                                child: Text(
                                  'Add Room',
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 60,
                                    vertical: 15,
                                  ),
                                  primary: Colors.orange.shade300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                viewModel.successMessage ?? '',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
