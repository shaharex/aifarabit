import 'package:jihc_hack/src/features/map/data/models/location_model/place_model.dart';


abstract class PlaceRepository {
  Future<List<PlaceModel>> getPlaces();
}
