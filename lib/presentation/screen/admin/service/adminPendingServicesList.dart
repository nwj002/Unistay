import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AdminPendingServiceListScreen extends StatelessWidget {
  AdminPendingServiceListScreen(this.serviceTitle);

  String serviceTitle;

@override
  Widget build(BuildContext context) {
    List<Service> serviceList = [];
    final serviceListRaw = Provider.of<List<Service>?>(context);
    serviceListRaw?.forEach(
      (element) {
        if (element.status == 0 && serviceTitle == element.serviceTitle) {
          serviceList.add(element);
        }
        ;
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text(
            'Pending Services',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: serviceList.length != 0
          ? Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: serviceList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApproveDennyServiceSceen(
                                  serviceList[index])));
                    },