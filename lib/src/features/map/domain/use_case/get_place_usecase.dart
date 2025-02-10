import 'package:jihc_hack/src/features/map/data/models/location_model/place_model.dart';
import '../repositories/place_repository.dart';

class GetPlacesUseCase {
  final PlaceRepository repository;

  GetPlacesUseCase(this.repository);

  Future<List<PlaceModel>> call() async {
  final places = await repository.getPlaces();
  print('places: $places'); 
  return places;
}

}
