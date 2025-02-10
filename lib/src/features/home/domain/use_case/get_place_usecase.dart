import 'package:jihc_hack/src/features/home/domain/entity/place_entity.dart';
import '../repositories/place_repository.dart';

class GetPlacesUseCase {
  final PlaceRepository repository;

  GetPlacesUseCase(this.repository);

  Future<List<PlaceEntity>> call() async {
    return await repository.getPlaces();
  }
}
