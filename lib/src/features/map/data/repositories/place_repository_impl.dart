import 'package:jihc_hack/src/features/map/data/data_source/place_remote_datasource.dart';
import 'package:jihc_hack/src/features/map/domain/entity/place_entity.dart';

import '../../domain/repositories/place_repository.dart';


class PlaceRepositoryImpl implements PlaceRepository {
  final PlaceRemoteDataSource remoteDataSource;

  PlaceRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<PlaceEntity>> getPlaces() async {
    final places = await remoteDataSource.getPlaces();
    return places.map((model) => model.toEntity()).toList();
  }
}