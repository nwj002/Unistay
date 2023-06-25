import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  bool _isMenuOpen = false;
  int _selectedIndex = 0;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: _toggleMenu,
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          key: _formKey,
          children: [
            Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
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
                  const SizedBox(height: 80),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 900,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            primary: Colors.orange.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: const Text("Edit Personal Information",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            primary: Colors.orange.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: const Text("Hostels",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ),
                        
                        
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(300, 50),
                              primary: Colors.orange.shade300,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: const Text(
                              "Invoice History",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(300, 50),
                              primary: Colors.orange.shade300,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: const Text(
                              "Tickets",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(300, 50),
                              primary: Colors.orange.shade300,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: const Text(
                              "Update Password",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(300, 50),
                              primary: Colors.orange.shade300,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: const Text(
                              "Settings",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(300, 50),
                              primary: Colors.orange.shade300,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: const Text("Delete Account",
                                style: TextStyle(
                                  fontSize: 20,
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 70,
              bottom: 150,
              right:
                  _isMenuOpen ? 0 : -(MediaQuery.of(context).size.width - 56),
              width: 220,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child:  Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              // backgroundImage: AssetImage('path_to_your_photo'),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Your Name',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.calendar_month, color: Colors.blueGrey),
                        title: Text('Calendar',
                            style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 1 tap
                        },
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.edit_document, color: Colors.blueGrey),
                        title: Text('My Documents',
                            style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 2 tap
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.logo_dev, color: Colors.blueGrey),
                        title: Text('Add Clubs',
                            style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 3 tap
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.person_2, color: Colors.blueGrey),
                        title: Text('Appointment',
                            style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 4 tap
                        },
                      ),
                      
                      ListTile(
                        leading: Icon(Icons.lock, color: Colors.blueGrey),
                        title: Text('Privacy Policy',
                            style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 6 tap
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.logout, color: Colors.blueGrey),
                        title: Text('Logout',
                            style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 7 tap
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
