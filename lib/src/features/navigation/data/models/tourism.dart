import 'package:freezed_annotation/freezed_annotation.dart';

part 'tourism.freezed.dart';
part 'tourism.g.dart';

@freezed
class TourismData with _$TourismData {
  const factory TourismData({
    required String city,
    required List<Hotel> hotels,
    required Emergency emergency,
    required List<Restaurant> restaurants,
    required Attractions attractions,
    required Services services,
  }) = _TourismData;

  factory TourismData.fromJson(Map<String, dynamic> json) =>
      _$TourismDataFromJson(json);
}

@freezed
class Hotel with _$Hotel {
  const factory Hotel({
    required String name,
    required int price,
    required double rating,
    required String address,
    required List<String> images,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}

@freezed
class Emergency with _$Emergency {
  const factory Emergency({
    required List<Hospital> hospitals,
  }) = _Emergency;

  factory Emergency.fromJson(Map<String, dynamic> json) =>
      _$EmergencyFromJson(json);
}

@freezed
class Hospital with _$Hospital {
  const factory Hospital({
    required String name,
    required String address,
  }) = _Hospital;

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);
}

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String name,
    required String address,
    required String price,
    required String rating,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

@freezed
class Attractions with _$Attractions {
  const factory Attractions({
    required List<Attraction> historical,
    required List<Attraction> nature,
    required List<Attraction> sport,
    required List<Attraction> entertain,
  }) = _Attractions;

  factory Attractions.fromJson(Map<String, dynamic> json) =>
      _$AttractionsFromJson(json);
}

@freezed
class Attraction with _$Attraction {
  const factory Attraction({
    required String name,
    required String desc,
    required List<String> images,
  }) = _Attraction;

  factory Attraction.fromJson(Map<String, dynamic> json) =>
      _$AttractionFromJson(json);
}

@freezed
class Services with _$Services {
  const factory Services({
    required String taxi,
    required List<String> map,
  }) = _Services;

  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);
}
