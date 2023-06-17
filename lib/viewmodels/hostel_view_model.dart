import '../models/hostel.dart';
import '../repositories/hostel_repository.dart';


class HostelViewModel {
  final HostelRepository _hostelRepository = HostelRepository();

  Future<void> addHostel(Hostel hostel) {
    return _hostelRepository.addHostel(hostel);
  }
}
