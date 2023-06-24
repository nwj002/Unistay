import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}



final _formKey = GlobalKey<FormState>();

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: 80),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "PROFILE",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 648,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 50,
                                // Add your photo upload logic here
                                // You can use a GestureDetector or InkWell widget to handle the tap event
                                // and invoke a function to select/upload the photo.
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            width:double.infinity,
                            height: 60,
                            child: ElevatedButton(

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade300),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),

                                        side: BorderSide(color: Colors.orange.shade300),


                                      )
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20)),
                                ),
                                onPressed: (){
                                }, child: Text("Edit Personal Details", style: TextStyle(
                                fontSize: 12, color: Colors.black
                            ),)),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 60,
                            width:double.infinity,
                            child: ElevatedButton(

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade300),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),

                                        side: BorderSide(color: Colors.orange.shade300),


                                      )
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20)),
                                ),
                                onPressed: (){
                                }, child: Text("Update Password", style: TextStyle(
                                fontSize: 12, color: Colors.black
                            ),)),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width:double.infinity,
                            height: 60,
                            child: ElevatedButton(

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade300),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),

                                        side: BorderSide(color: Colors.orange.shade300),


                                      )
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20)),
                                ),
                                onPressed: (){
                                }, child: Text("Payments and Payouts", style: TextStyle(
                                fontSize: 12,color: Colors.black
                            ),)),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width:double.infinity,
                            height: 60,
                            child: ElevatedButton(

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade300),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),

                                        side: BorderSide(color: Colors.orange.shade300),


                                      )
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20)),
                                ),
                                onPressed: (){
                                }, child: Text("Notification", style: TextStyle(
                                fontSize: 12, color: Colors.black
                            ),)),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width:double.infinity,
                            height: 60,
                            child: ElevatedButton(

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade300),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),

                                        side: BorderSide(color: Colors.orange.shade300),


                                      )
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20)),
                                ),
                                onPressed: (){
                                }, child: Text("Delete Account", style: TextStyle(
                                fontSize: 12,color: Colors.red
                            ),)),
                          ),
                        ],
                      ),
                    ),


                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );



  }
}
