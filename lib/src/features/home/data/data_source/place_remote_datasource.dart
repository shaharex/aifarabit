import 'package:dio/dio.dart';
import 'package:jihc_hack/src/features/home/data/models/location_model/place_model.dart';


abstract class PlaceRemoteDataSource {
  Future<List<PlaceModel>> getPlaces();
}

class PlaceRemoteDataSourceImpl implements PlaceRemoteDataSource {
  final Dio dio;
  final String baseUrl = "https://hackaton-isn7.onrender.com";

  PlaceRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PlaceModel>> getPlaces() async {
    final response = await dio.get("$baseUrl/places");
    return (response.data as List).map((json) => PlaceModel.fromJson(json)).toList();
  }
}