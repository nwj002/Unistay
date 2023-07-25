import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/admin/adminDashbord.dart';
import 'package:hostelapplication/presentation/screen/student/studentDashbord.dart';

import 'onBordingScreen.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;

class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}
class _SplashScreen1State extends State<SplashScreen1> {
  int loginNum = 0;
  var emailAddress;
  @override
  void initState() {
    super.initState();
    checkUserType();