
import 'package:jihc_hack/src/features/map/data/data_source/place_remote_datasource.dart';
import 'package:jihc_hack/src/features/map/data/models/location_model/place_model.dart';
import 'package:jihc_hack/src/features/map/domain/repositories/place_repository.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final PlaceRemoteDataSource remoteDataSource;

  PlaceRepositoryImpl(this.remoteDataSource);

    @override
  Future<List<PlaceModel>> getPlaces() async {
  try {
    final data = await remoteDataSource.getPlaces();
    return data;
  } catch (e) {
    print(e);
    return [];
  }
}


}
