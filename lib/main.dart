import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:ai_farabi/firebase_options.dart';
import 'package:ai_farabi/src/features/auth/presentation/pages/auth_gate.dart';
import 'package:ai_farabi/src/features/map/data/data_source/place_remote_datasource.dart';
import 'package:ai_farabi/src/features/map/data/repositories/place_repository_impl.dart';
import 'package:ai_farabi/src/features/map/domain/repositories/place_repository.dart';
import 'package:ai_farabi/src/features/map/domain/use_case/get_place_usecase.dart';
import 'package:ai_farabi/src/features/map/presentation/bloc/place_bloc/places_bloc.dart';
import 'package:ai_farabi/src/features/navigation/data/datasources/tourism_datasource.dart';
import 'package:ai_farabi/src/features/navigation/data/repository/tourism_repository_impl.dart';
import 'package:ai_farabi/src/features/navigation/domain/repository/tourism_repository.dart';
import 'package:ai_farabi/src/features/navigation/domain/usecases/get_tourism_data.dart';
import 'package:ai_farabi/src/features/navigation/presentation/bloc/tourism_bloc.dart';
import 'package:ai_farabi/src/features/preferences/data/datasources/remote_datasource.dart';
import 'package:ai_farabi/src/features/preferences/data/repository/city_repository_impl.dart';
import 'package:ai_farabi/src/features/preferences/domain/repository/city_repository.dart';
import 'package:ai_farabi/src/features/preferences/domain/usecases/get_city.dart';
import 'package:ai_farabi/src/features/preferences/presentation/bloc/cities_bloc.dart';
import 'package:ai_farabi/src/core/hive/hive_serv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await HiveService.init();
  final getIt = GetIt.instance;
  await Geolocator.requestPermission();

  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<PlaceRemoteDataSource>(
      () => PlaceRemoteDataSourceImpl(getIt<Dio>()));

  getIt.registerLazySingleton<PlaceRepository>(
      () => PlaceRepositoryImpl(getIt<PlaceRemoteDataSource>()));

  getIt.registerLazySingleton<GetPlacesUseCase>(
      () => GetPlacesUseCase(getIt<PlaceRepository>()));

  getIt.registerLazySingleton(() => PlacesBloc(getIt<GetPlacesUseCase>()));

  getIt.registerLazySingleton<CityRemoteDatasource>(
      () => CityRemoteDatasource());
  getIt.registerLazySingleton<CityRepository>(() =>
      CityRepositoryImpl(remoteDataSource: getIt<CityRemoteDatasource>()));
  getIt.registerLazySingleton<GetCityUseCase>(
      () => GetCityUseCase(cityRepository: getIt<CityRepository>()));
  getIt.registerLazySingleton(
      () => CitiesBloc(getCityUseCase: getIt<GetCityUseCase>()));

  getIt.registerLazySingleton<TourismDatasource>(() => TourismDatasource());
  getIt.registerLazySingleton<TourismRepository>(() =>
      TourismRepositoryImpl(tourismDatasource: getIt<TourismDatasource>()));

  getIt.registerLazySingleton<GetTourismDataUseCase>(() =>
      GetTourismDataUseCase(tourismRepository: getIt<TourismRepository>()));
  getIt.registerLazySingleton<TourismBloc>(
      () => TourismBloc(getTourismDataUseCase: getIt<GetTourismDataUseCase>()));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.instance<PlacesBloc>()),
        BlocProvider(create: (context) => GetIt.instance<CitiesBloc>()),
        BlocProvider(create: (context) => GetIt.instance<TourismBloc>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InitializePage(),
      ),
    );
  }
}
