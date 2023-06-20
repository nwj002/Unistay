import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../repositories/room_repository.dart';


class AddRoomsViewModel extends ChangeNotifier {
  final RoomRepository _roomRepository = RoomRepository();

  final TextEditingController roomNameController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  String? _successMessage;
  String? get successMessage => _successMessage;

  AddRoomsViewModel() {
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    checkSignInStatus();
  }

  Future<void> checkSignInStatus() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    _isSignedIn = currentUser != null;
    notifyListeners();
  }

  Future<void> addRoom(String roomName, int capacity) async {
    if (!_isSignedIn) {
      _successMessage = 'You must sign in to add a room.';
      notifyListeners();
      return;
    }

    if (!formKey.currentState!.validate()) {
      return;
    }

    String roomName = roomNameController.text;
    int capacity = int.parse(capacityController.text);

    try {
      await _roomRepository.addRoom(roomName, capacity);
      _successMessage = 'Room added successfully: $roomName';
    } catch (e) {
      _successMessage = 'Error adding room: $e';
    }

    notifyListeners();
  }

  @override
  void dispose() {
    roomNameController.dispose();
    capacityController.dispose();
    super.dispose();
  }
}
