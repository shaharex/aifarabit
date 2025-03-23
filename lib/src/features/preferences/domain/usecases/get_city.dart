import 'package:jihc_hack/src/features/preferences/domain/entity/city.dart';
import 'package:jihc_hack/src/features/preferences/domain/repository/city_repository.dart';

class GetCityUseCase {
  GetCityUseCase({required this.cityRepository});

  final CityRepository cityRepository;

  Future<List<City>> execute(String preferences, String country) async {
    return await cityRepository.getCities(preferences, country);
  }
}
