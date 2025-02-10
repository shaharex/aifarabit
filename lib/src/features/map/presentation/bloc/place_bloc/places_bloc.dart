import 'package:bloc/bloc.dart';
import 'package:jihc_hack/src/features/map/data/models/location_model/place_model.dart';
import 'package:jihc_hack/src/features/map/domain/use_case/get_place_usecase.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'places_event.dart';
part 'places_state.dart';
part 'places_bloc.freezed.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final GetPlacesUseCase getPlacesUseCase;

  PlacesBloc(this.getPlacesUseCase) : super(const PlacesState.initial()) {
    on<PlacesEvent>(_onEventHandler);
  }

  Future<void> _onEventHandler(PlacesEvent event, Emitter<PlacesState> emit) async {
    await event.when(
      getPlaces: () => _getPlaces(emit),
    );
  }

  Future<void> _getPlaces(Emitter<PlacesState> emit) async {
    
    emit(const PlacesState.loading());
    try {
      final places = await getPlacesUseCase.call();
      emit(PlacesState.loaded(viewModel: PlacesViewModel(cartItems: places)));
      print('finished');
    } catch (e) {
      emit(const PlacesState.loadingFaliure());
    }
  }
}
