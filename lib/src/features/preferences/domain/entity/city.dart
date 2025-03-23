import 'package:equatable/equatable.dart';

class City extends Equatable {
  const City({
    required this.city,
    required this.description,
  });

  final String city;
  final String description;

  @override
  List<Object?> get props => [city, description];
}
