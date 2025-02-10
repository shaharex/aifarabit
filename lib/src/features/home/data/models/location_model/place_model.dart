import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jihc_hack/src/features/home/domain/entity/place_entity.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class PlaceModel with _$PlaceModel {
  const factory PlaceModel({
    required int id,
    required String placeName,
    required double rating,
    required String description,
    required List<String> photoURLs,
    required List<String> comments,
    required double longitude,
    required double latitude,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => _$PlaceModelFromJson(json);

  factory PlaceModel.fromEntity(PlaceEntity entity) => PlaceModel(
        id: entity.id,
        placeName: entity.placeName,
        rating: entity.rating,
        description: entity.description,
        photoURLs: entity.photoURLs,
        comments: entity.comments,
        longitude: entity.longitude,
        latitude: entity.latitude,
      );

  PlaceEntity toEntity() => PlaceEntity(
        id: id,
        placeName: placeName,
        rating: rating,
        description: description,
        photoURLs: photoURLs,
        comments: comments,
        longitude: longitude,
        latitude: latitude,
      );
}
