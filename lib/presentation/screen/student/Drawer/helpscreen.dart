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
