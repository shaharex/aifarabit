import 'package:jihc_hack/src/features/preferences/domain/entity/city.dart';

abstract class CityRepository {
  Future<List<City>> getCities(String preferences, String country);
}
