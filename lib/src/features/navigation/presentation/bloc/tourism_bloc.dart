import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jihc_hack/src/features/navigation/data/models/tourism.dart';
import 'package:jihc_hack/src/features/navigation/domain/usecases/get_tourism_data.dart';

part 'tourism_event.dart';
part 'tourism_state.dart';
part 'tourism_bloc.freezed.dart';

class TourismBloc extends Bloc<TourismEvent, TourismState> {
  final GetTourismDataUseCase getTourismDataUseCase;

  TourismBloc({required this.getTourismDataUseCase})
      : super(const TourismState.initial()) {
    on<GetTourismData>((event, emit) async {
      try {
        emit(const TourismState.loading());
        final tourismData = await getTourismDataUseCase.execute(
            country: event.country,
            city: event.city,
            preferences: event.preferences);

        emit(TourismState.success(tourismData));
      } catch (e) {
        emit(TourismState.failure(e.toString()));
      }
    });
  }
}
