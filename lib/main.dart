import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jihc_hack/firebase_options.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/auth_gate.dart';
import 'package:jihc_hack/src/features/map/data/data_source/place_remote_datasource.dart';
import 'package:jihc_hack/src/features/map/data/repositories/place_repository_impl.dart';
import 'package:jihc_hack/src/features/map/domain/repositories/place_repository.dart';
import 'package:jihc_hack/src/features/map/domain/use_case/get_place_usecase.dart';
import 'package:jihc_hack/src/features/map/presentation/bloc/place_bloc/places_bloc.dart';
import 'package:jihc_hack/src/features/navigation/presentation/pages/navigation_page.dart';
import 'package:jihc_hack/src/features/preferences/presentation/pages/choose_city_page.dart';
import 'package:jihc_hack/src/features/preferences/presentation/pages/preferences_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<PlaceRemoteDataSource>(
      () => PlaceRemoteDataSourceImpl(getIt<Dio>()));

  getIt.registerLazySingleton<PlaceRepository>(
      () => PlaceRepositoryImpl(getIt<PlaceRemoteDataSource>()));

  getIt.registerLazySingleton<GetPlacesUseCase>(
      () => GetPlacesUseCase(getIt<PlaceRepository>()));

  getIt.registerLazySingleton(() => PlacesBloc(getIt<GetPlacesUseCase>()));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<PlacesBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationPage(),
      ),
    );
  }
}
