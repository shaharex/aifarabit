part of 'cities_bloc.dart';

@freezed
class CitiesEvent with _$CitiesEvent {
  const factory CitiesEvent.fetchCities(
      {required String preferences, required String country}) = FetchCities;
}
