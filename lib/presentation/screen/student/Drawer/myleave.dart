import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';
import 'package:hostelapplication/logic/provider/leave_provider.dart';
import 'package:provider/provider.dart';

class MyLeave extends StatelessWidget {
  const MyLeave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<Leave> Leavelist = [];
    final leaveprovider = Provider.of<LeaveProvider>(context);
    final leaveListRaw = Provider.of<List<Leave>?>(context);
    leaveListRaw?.forEach((element) {
      if (auth.currentUser?.uid == element.studentUid && element.status == 0) {
        Leavelist.add(element);
      }
      ;
    });
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: