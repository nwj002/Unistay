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
