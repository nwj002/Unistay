// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:unistay/core/constant/string.dart';
import 'package:unistay/logic/services/auth_services/auth_service.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.orangeAccent,
                          child: Icon(Icons.account_circle_rounded),
                          
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Admin",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 50, child: Divider()),

            ListTile(
              title: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.orangeAccent,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Add staff details',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, addStaffDetailsScreenRoute);
                // Navigator.pop(context);
              },
            ),

             ListTile(
              title: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.file,
                    color: Colors.orangeAccent,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Staff details',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, staffDetailsScreenRoute);
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.question,
                    color: Colors.orangeAccent,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Help',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onTap: () {
                // Navigator.pushNamed(context, helpscreenRoute);
                Navigator.pop(context);
              },
            ),
            //logout
            ListTile(
              title: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.signOut,
                    color: Colors.orangeAccent,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onTap: () {
                authService.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, logInScreenRoute, (route) => false);  //navigate to login screen
              },
            ),
            const SizedBox(width: 50, child: Divider()),
          ],
        ),
      ),
    );
  }
}
