import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final helpstyle = TextStyle(
        color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 20);
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
        "Help",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    )),
    body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Column(
    children: [
    Padding(
    padding:
        const EdgeInsets.only(top: 18.0, left: 18, right: 18),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    GestureDetector(
    onTap: () {},
    child: Text.rich(
    TextSpan(
    children: [
    WidgetSpan(
    child: Icon(
    Icons.home_outlined,
    color: Colors.blue.shade900,
    ),
    ),
    TextSpan(text: '   Home ', style: helpstyle),
    ],
    ),
    ),
    ),
    BulletList(const [
    "Here you can see the all updates about your hostel. The information posted here is officially approved by management."
    ]),
    const Divider(thickness: 1),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
        onTap: () {},
    child: Text.rich(
    TextSpan(
    children: [
    WidgetSpan(
    child: Icon(
    Icons.content_paste_go_sharp,
    color: Colors.blue.shade900,
    ),
    ),
    TextSpan(
    text: '   Complaint Screen ',
    style: helpstyle),
    ],
    ),
    ),
    ),
    BulletList(const [
    "Here you are able to post your complaints you are facing in your hostel",
    "if the complaints were accepted and the problems were solved, you'll get a notification"
    ]),
    const Divider(thickness: 1),
    const SizedBox(
    height: 5,
    ),
