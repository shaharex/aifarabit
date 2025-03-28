part of 'tourism_bloc.dart';

@freezed
class TourismState with _$TourismState {
  const factory TourismState.initial() = _Initial;
  const factory TourismState.loading() = _Loading;
  const factory TourismState.success(TourismData data, String country, String preferences) = _Success;
  const factory TourismState.failure(String message) = _Failure;
}
