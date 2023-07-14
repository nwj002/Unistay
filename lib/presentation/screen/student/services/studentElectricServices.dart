import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/repairDeviceWidget.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/serviceTextField.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/userTable.dart';
import 'package:provider/provider.dart';

import 'package:hostelapplication/logic/modules/userData_model.dart';
import 'package:hostelapplication/logic/provider/service_provider.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';

class StudentElectricityServices extends StatefulWidget {
  const StudentElectricityServices({Key? key}) : super(key: key);

  @override
  State<StudentElectricityServices> createState() =>
      _StudentElectricityServicesState();
}