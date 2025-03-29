import 'package:ai_farabi/src/features/navigation/data/models/tourism.dart';
import 'package:ai_farabi/src/features/navigation/domain/repository/tourism_repository.dart';

class GetTourismDataUseCase {
  GetTourismDataUseCase({required this.tourismRepository});

  final TourismRepository tourismRepository;

  Future<TourismData> execute(
      {required String country,
      required String city,
      required String preferences}) async {
    return tourismRepository.getTourismData(
        city: city, country: country, preferences: preferences);
  }
}
