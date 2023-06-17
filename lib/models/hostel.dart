class Hostel {
  String name;
  String address;
  int capacity;

  Hostel({required this.name, required this.address, required this.capacity});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'capacity': capacity,
    };
  }
}
