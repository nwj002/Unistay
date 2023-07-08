import 'package:flutter/foundation.dart';
import 'package:hostelapplication/logic/modules/service_model.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/service_firestore_service.dart';
import 'package:uuid/uuid.dart';

class ServiceProvider with ChangeNotifier {
  final service = ServiceFirestoreService();

  late String _serviceDes;
  late List _repairDeviceList;
  late String _name;
  late String _roomNo;
  late String _studentUid;
  late String _serviceTitle;
  DateTime _time = DateTime.now();
  var uuid = Uuid();

