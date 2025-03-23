import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jihc_hack/src/features/preferences/domain/entity/city.dart';
import 'package:jihc_hack/src/features/preferences/domain/usecases/get_city.dart';

part 'cities_event.dart';
part 'cities_state.dart';
part 'cities_bloc.freezed.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final GetCityUseCase getCityUseCase;

  CitiesBloc({required this.getCityUseCase}) : super(CitiesState.initial()) {
    on<FetchCities>((event, emit) async {
      try {
        emit(CitiesState.loading());
        final cities =
            await getCityUseCase.execute(event.preferences, event.country);
        emit(CitiesState.success(cities));
      } catch (e) {
        emit(CitiesState.failure(e.toString()));
      }
    });
  }
}
