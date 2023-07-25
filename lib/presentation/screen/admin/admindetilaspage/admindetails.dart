import 'package:flutter/material.dart';

class AdminDetailsScreen extends StatelessWidget {
  const AdminDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String studentname = "Admin";
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
        "Details",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    )),