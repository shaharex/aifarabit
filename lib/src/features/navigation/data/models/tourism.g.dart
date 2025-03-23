// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourism.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TourismDataImpl _$$TourismDataImplFromJson(Map<String, dynamic> json) =>
    _$TourismDataImpl(
      city: json['city'] as String,
      hotels: (json['hotels'] as List<dynamic>)
          .map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList(),
      emergency: Emergency.fromJson(json['emergency'] as Map<String, dynamic>),
      restaurants: (json['restaurants'] as List<dynamic>)
          .map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
      attractions:
          Attractions.fromJson(json['attractions'] as Map<String, dynamic>),
      services: Services.fromJson(json['services'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TourismDataImplToJson(_$TourismDataImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'hotels': instance.hotels,
      'emergency': instance.emergency,
      'restaurants': instance.restaurants,
      'attractions': instance.attractions,
      'services': instance.services,
    };

_$HotelImpl _$$HotelImplFromJson(Map<String, dynamic> json) => _$HotelImpl(
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      address: json['address'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$HotelImplToJson(_$HotelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'rating': instance.rating,
      'address': instance.address,
      'images': instance.images,
    };

_$EmergencyImpl _$$EmergencyImplFromJson(Map<String, dynamic> json) =>
    _$EmergencyImpl(
      hospitals: (json['hospitals'] as List<dynamic>)
          .map((e) => Hospital.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EmergencyImplToJson(_$EmergencyImpl instance) =>
    <String, dynamic>{
      'hospitals': instance.hospitals,
    };

_$HospitalImpl _$$HospitalImplFromJson(Map<String, dynamic> json) =>
    _$HospitalImpl(
      name: json['name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$HospitalImplToJson(_$HospitalImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
    };

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      name: json['name'] as String,
      address: json['address'] as String,
      price: json['price'] as String,
      rating: json['rating'] as String,
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'price': instance.price,
      'rating': instance.rating,
    };

_$AttractionsImpl _$$AttractionsImplFromJson(Map<String, dynamic> json) =>
    _$AttractionsImpl(
      historical: (json['historical'] as List<dynamic>)
          .map((e) => Attraction.fromJson(e as Map<String, dynamic>))
          .toList(),
      nature: (json['nature'] as List<dynamic>)
          .map((e) => Attraction.fromJson(e as Map<String, dynamic>))
          .toList(),
      sport: (json['sport'] as List<dynamic>)
          .map((e) => Attraction.fromJson(e as Map<String, dynamic>))
          .toList(),
      entertain: (json['entertain'] as List<dynamic>)
          .map((e) => Attraction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AttractionsImplToJson(_$AttractionsImpl instance) =>
    <String, dynamic>{
      'historical': instance.historical,
      'nature': instance.nature,
      'sport': instance.sport,
      'entertain': instance.entertain,
    };

_$AttractionImpl _$$AttractionImplFromJson(Map<String, dynamic> json) =>
    _$AttractionImpl(
      name: json['name'] as String,
      desc: json['desc'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$AttractionImplToJson(_$AttractionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'desc': instance.desc,
      'images': instance.images,
    };

_$ServicesImpl _$$ServicesImplFromJson(Map<String, dynamic> json) =>
    _$ServicesImpl(
      taxi: json['taxi'] as String,
      map: (json['map'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ServicesImplToJson(_$ServicesImpl instance) =>
    <String, dynamic>{
      'taxi': instance.taxi,
      'map': instance.map,
    };
