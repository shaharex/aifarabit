import 'package:jihc_hack/src/features/preferences/domain/entity/city.dart';

class CityModel {
  final String city;
  final String description;

  CityModel({
    required this.city,
    required this.description,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      city: json["city"],
      description: json["reason"],
    );
  }

  City toEntity() => City(
        city: city,
        description: description,
      );
}
