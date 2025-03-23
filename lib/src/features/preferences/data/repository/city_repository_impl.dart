import 'package:jihc_hack/src/features/preferences/data/datasources/remote_datasource.dart';
import 'package:jihc_hack/src/features/preferences/domain/entity/city.dart';
import 'package:jihc_hack/src/features/preferences/domain/repository/city_repository.dart';

class CityRepositoryImpl extends CityRepository {
  final CityRemoteDatasource remoteDataSource;
  CityRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<City>> getCities(String preferences, String country) async {
    final cityModels = await remoteDataSource.getCities(preferences, country);
    return cityModels.map((city) => city.toEntity()).toList();
  }
}
