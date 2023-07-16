import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Privacy Policy'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Privacy Policy',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 8.0),
    Text(
    'Last updated: July 13, 2023',
    style: TextStyle(fontSize: 12),
    ),
