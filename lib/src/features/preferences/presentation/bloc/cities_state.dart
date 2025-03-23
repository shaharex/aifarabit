part of 'cities_bloc.dart';

@freezed
class CitiesState with _$CitiesState {
  const factory CitiesState.initial() = _Initial;
  const factory CitiesState.loading() = _Loading;
  const factory CitiesState.success(List<City> cities) = _Success;
  const factory CitiesState.failure(String message) = _Failure;
}
