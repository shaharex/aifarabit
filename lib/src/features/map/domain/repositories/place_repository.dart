import 'package:ai_farabi/src/features/map/data/models/location_model/place_model.dart';


abstract class PlaceRepository {
  Future<List<PlaceModel>> getPlaces();
}
