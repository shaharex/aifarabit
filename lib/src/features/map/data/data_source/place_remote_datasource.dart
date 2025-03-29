import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ai_farabi/src/features/map/data/models/location_model/place_model.dart';


abstract class PlaceRemoteDataSource {
  Future<List<PlaceModel>> getPlaces();
}

class PlaceRemoteDataSourceImpl implements PlaceRemoteDataSource {
  final Dio dio;
  // final String baseUrl = "https://hackaton-isn7.onrender.com";

  PlaceRemoteDataSourceImpl(this.dio);

    @override
  Future<List<PlaceModel>> getPlaces() async {
  try {
    print(' fetching');
    final response = await dio.get('https://hackaton-isn7.onrender.com/places');

    if (response.data is String) {
      response.data = jsonDecode(response.data); 
    }

    final places = (response.data as List).map((e) => PlaceModel.fromJson(e)).toList();
    return places;
  } catch (e) {
    print(e);
    return [];
  }
}

}