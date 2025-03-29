import 'package:dio/dio.dart';
import 'package:jihc_hack/src/core/constants/api_key.dart';

class UnsplashService {
  static const String _baseUrl = "https://api.unsplash.com";
  static const String _accessKey = ApiKey.unsplashApiKey;

  final Dio _dio = Dio();

  Future<List<UnsplashImage>> fetchImages(String query) async {
    try {
      final response = await _dio.get(
        "$_baseUrl/search/photos",
        queryParameters: {
          "query": query,
          "client_id": _accessKey,
          "per_page": 10,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        return results.map((json) => UnsplashImage.fromJson(json)).toList();
      }
    } catch (e) {
      print("Error fetching images: $e");
    }
    return [];
  }
}

class UnsplashImage {
  final String id;
  final String imageUrl;

  UnsplashImage({required this.id, required this.imageUrl});

  factory UnsplashImage.fromJson(Map<String, dynamic> json) {
    return UnsplashImage(
      id: json['id'],
      imageUrl: json['urls']['regular'],
    );
  }
}
