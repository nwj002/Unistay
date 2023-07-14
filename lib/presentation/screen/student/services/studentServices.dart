import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/presentation/screen/student/services/StudentPastService.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';

class StudentServicesScreen extends StatefulWidget {
  const StudentServicesScreen({Key? key}) : super(key: key);

  @override
  State<StudentServicesScreen> createState() => _StudentServicesScreenState();
}
class _StudentServicesScreenState extends State<StudentServicesScreen> {
  List<String> images = [
    'assets/images/room.png',
    'assets/images/dinner.png',
    'assets/images/bath.png',
    'assets/images/thunderbolt.png',
    'assets/images/other.png'
  ];
  List<String> imagesText = [
    'Room',
    'Mess',
    'Bathroom',
    'Electricity',
    'Other'
  ];
  List navigatorRoute = [
    studentRoomServiceRoute,
    studentMessServiceRoute,
    studentBathRoomServiceRoute,
    studentElectricityServiceRoute,
    studentOtherServiceRoute,
  ];