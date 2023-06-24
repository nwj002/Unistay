import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'AdminRegisterScreen.dart';
import 'Profile.dart';
import 'RegisterScreen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isMenuOpen = false;
  int _selectedIndex = -1;

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

  final List<Widget> _pages = [
    RegisterScreen(), // Keep the booking screen instead of Register Screen here
    Profile(),
    AdminRegisterScreen(), // Keep the ticket screen instead of admin register screen here
  ];

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
          children: [
            Container(
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
                  SizedBox(height: 20),
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
                    margin:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button tap
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange.shade300,
                        ),
                        child: Text('Room Details'),
                      ),
                    ),
                  ),
                  Container(  // content to display hostel details
                    height: 520,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.all(20.0), // Add padding to the container
                    child: Column(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: InkWell(
                            onTap: () {
                              // Handle button tap
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(30.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  // add hostel image and name in this container
                                  SizedBox(height: 55),
                                  // Add your desired content here
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],

                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 70,
              bottom: 150,
              right: _isMenuOpen ? 0 : -(MediaQuery.of(context).size.width - 56),
              width: 220,
              child: Container(
                color: Colors.grey.shade100,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              // backgroundImage: AssetImage('path_to_your_photo'),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Your Name',
                              style: TextStyle(color: Colors.blueGrey, fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_month, color: Colors.blueGrey),
                        title: Text('Calendar', style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 1 tap
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.edit_document, color: Colors.blueGrey),
                        title: Text('My Documents', style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 2 tap
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.logo_dev, color: Colors.blueGrey),
                        title: Text('Clubs', style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 3 tap
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.person_2, color: Colors.blueGrey),
                        title: Text('Appointment', style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 4 tap
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.book, color: Colors.blueGrey),
                        title: Text('Disciplinary Acts', style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 5 tap
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.lock, color: Colors.blueGrey),
                        title: Text('Privacy Policy', style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 6 tap
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.logout, color: Colors.blueGrey),
                        title: Text('Logout', style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 7 tap
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_selectedIndex >= 0)
              Positioned.fill(
                top: 0,
                child: Container(
                  // color: Colors.white,
                  child: _pages[_selectedIndex],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(30),
        ),
        child: Container(
          color: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: GNav(
              backgroundColor: Colors.grey.shade300,
              color: Colors.black,
              activeColor: Colors.black,
              tabBackgroundColor: Colors.orange.shade300,
              padding: EdgeInsets.all(16),
              gap: 8,
              onTabChange: _onNavItemTapped,
              selectedIndex: _selectedIndex,
              tabs: [
                GButton(icon: Icons.event, text: "Booking"),
                GButton(icon: Icons.person, text: "Profile"),
                GButton(icon: Icons.airplane_ticket, text: "Ticket"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
