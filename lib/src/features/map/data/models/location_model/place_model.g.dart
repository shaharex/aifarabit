// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceModelImpl _$$PlaceModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaceModelImpl(
      id: json['id'] as String,
      placeName: json['placeName'] as String,
      rating: (json['rating'] as num).toInt(),
      description: json['description'] as String,
      photoURLs: (json['photoURLs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlaceModelImplToJson(_$PlaceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeName': instance.placeName,
      'rating': instance.rating,
      'description': instance.description,
      'photoURLs': instance.photoURLs,
      'comments': instance.comments,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
