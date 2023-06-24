import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UpdatePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final viewModel = PasswordUpdateViewModel();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade400,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Update Password',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Center the title horizontally
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade100,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align elements from top to bottom
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              TextFormField(
                // controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                // controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                // controller: _capacityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width:double.infinity,
                child: ElevatedButton(

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade300),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),

                            side: BorderSide(color: Colors.orange.shade300),


                          )
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20)),
                    ),
                    onPressed: (){
                    }, child: Text("Update", style: TextStyle(
                    fontSize: 20
                ),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
