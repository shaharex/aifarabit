
import 'package:equatable/equatable.dart';

class PlaceEntity extends Equatable {
  final int id;
  final String placeName;
  final double rating;
  final String description;
  final List<String> photoURLs;
  final List<String> comments;
  final double longitude;
  final double latitude;

  const PlaceEntity({
    required this.id,
    required this.placeName,
    required this.rating,
    required this.description,
    required this.photoURLs,
    required this.comments,
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [id, placeName, rating, description, photoURLs, comments, longitude, latitude];
}