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
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: Colors.black,
                          width: 0.1,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      serviceList[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),