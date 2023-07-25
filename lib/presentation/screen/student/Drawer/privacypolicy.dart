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
    SizedBox(height: 16.0),
    Text(
    'This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.',
    ),
    SizedBox(height: 8.0),
    Text(
    'We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Free Privacy Policy Generator.',
    ),
    SizedBox(height: 16.0),
    Text(
    'Interpretation and Definitions',
    style: TextStyle(fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 8.0),
    Text('Interpretation'),
    SizedBox(height: 4.0),
    Text(
    'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
    ),
    SizedBox(height: 8.0),
    Text('Definitions', style: TextStyle(fontWeight: FontWeight.bold)),
    SizedBox(height: 4.0),
    Text('For the purposes of this Privacy Policy:'),
    SizedBox(height: 4.0),