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