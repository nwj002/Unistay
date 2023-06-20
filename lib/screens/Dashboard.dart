import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
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
                              backgroundImage: AssetImage('path_to_your_photo'),
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
                        title: Text('Clubs',
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
                        leading: Icon(Icons.book, color: Colors.blueGrey),
                        title: Text('Disciplinary Acts',
                            style: TextStyle(color: Colors.blueGrey)),
                        onTap: () {
                          // Handle option 5 tap
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
      bottomNavigationBar: Container(
        height: 80.0, // Set the desired height
        child: Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(40.0), bottom: Radius.circular(40.0)),
            child: BottomAppBar(
              color: Colors.grey.shade300,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (_selectedIndex == -4)
                          Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade300,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.event),
                            SizedBox(width: 5),
                            if (_selectedIndex == -4) Text('Booking'),
                          ],
                        ),
                        IconButton(
                          icon: SizedBox(),
                          onPressed: () {
                            _onNavItemTapped(-4);
                          },
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (_selectedIndex == -5)
                          Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade300,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 5),
                            if (_selectedIndex == -5) Text('Profile'),
                          ],
                        ),
                        IconButton(
                          icon: SizedBox(),
                          onPressed: () {
                            _onNavItemTapped(-5);
                          },
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (_selectedIndex == -6)
                          Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade300,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.airplane_ticket),
                            SizedBox(width: 5),
                            if (_selectedIndex == -6) Text('Ticket'),
                          ],
                        ),
                        IconButton(
                          icon: SizedBox(),
                          onPressed: () {
                            _onNavItemTapped(-6);
                          },
                          color: Colors.transparent,
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
  }
}
