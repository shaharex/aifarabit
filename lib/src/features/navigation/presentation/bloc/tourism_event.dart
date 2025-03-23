part of 'tourism_bloc.dart';

@freezed
class TourismEvent with _$TourismEvent {
  const factory TourismEvent.getTourismData({
    required String country,
    required String city,
    required String preferences,
  }) = GetTourismData;
}
