import 'package:jihc_hack/src/features/navigation/data/datasources/tourism_datasource.dart';
import 'package:jihc_hack/src/features/navigation/data/models/tourism.dart';
import 'package:jihc_hack/src/features/navigation/domain/repository/tourism_repository.dart';

class TourismRepositoryImpl extends TourismRepository {
  TourismRepositoryImpl({required this.tourismDatasource});
  final TourismDatasource tourismDatasource;

  @override
  Future<TourismData> getTourismData({
    required String city,
    required String country,
    required String preferences,
  }) {
    return tourismDatasource.getTourismData(city, country, preferences);
  }
}
