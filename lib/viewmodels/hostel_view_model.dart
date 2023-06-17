import '../models/hostel.dart';
import '../repositories/hostel_repository.dart';

class HostelViewModel {
  final HostelRepository _repository = HostelRepository();

  Future<void> addHostel(Hostel hostel) async {
    try {
      await _repository.addHostel(hostel);
      print('Hostel saved successfully!');
    } catch (e) {
      // Handle any errors here
      print('Error saving hostel: $e');
    }
  }
}
