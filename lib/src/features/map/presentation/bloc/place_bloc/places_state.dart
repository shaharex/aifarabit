
part of 'places_bloc.dart';

@freezed
class PlacesState with _$PlacesState {
  const factory PlacesState.initial() = _Initial;
  const factory PlacesState.loading() = _Loading;
  const factory PlacesState.loadingFaliure() = _LoadingFailure;
  const factory PlacesState.loaded({required PlacesViewModel viewModel}) = _Loaded;
}

@freezed
class PlacesViewModel with _$PlacesViewModel {
  factory PlacesViewModel({
    List<PlaceModel>? cartItems,
  }) = _PlacesViewModel;
}