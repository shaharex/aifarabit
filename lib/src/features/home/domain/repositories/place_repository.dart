import 'package:jihc_hack/src/features/home/domain/entity/place_entity.dart';

abstract class PlaceRepository {
  Future<List<PlaceEntity>> getPlaces();
}
