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
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Column(
    children: [
    const SizedBox(
    height: 30,
    ),
    Container(
    padding: const EdgeInsets.all(10.0),
    width: MediaQuery.of(context).size.width / 3,
    height: MediaQuery.of(context).size.width / 3,
    decoration: BoxDecoration(
    border: Border.all(color: Colors.black, width: 1),