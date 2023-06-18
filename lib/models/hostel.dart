class Hostel {
  final String name;
  final String address;
  final int capacity;
  final String imageUrl;

  Hostel({
    required this.name,
    required this.address,
    required this.capacity,
    required this.imageUrl,
  });

  Hostel copyWith({
    String? name,
    String? address,
    int? capacity,
    String? imageUrl,
  }) {
    return Hostel(
      name: name ?? this.name,
      address: address ?? this.address,
      capacity: capacity ?? this.capacity,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
