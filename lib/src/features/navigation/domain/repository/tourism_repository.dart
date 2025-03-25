import 'package:jihc_hack/src/features/navigation/data/models/tourism.dart';

abstract class TourismRepository {
  Future<TourismData> getTourismData({
    required String city,
    required String country,
    required String preferences,
  });
}
