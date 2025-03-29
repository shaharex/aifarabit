import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ai_farabi/src/core/constants/api_key.dart';
import 'package:ai_farabi/src/features/preferences/data/models/city.dart';

class CityRemoteDatasource {
  final dio = Dio();

  Future<List<CityModel>> getCities(String preferences, String country) async {
    const String apiKey = ApiKey.gptApiKey;
    const String url = "https://api.openai.com/v1/chat/completions";

    final Dio dio = Dio();
    final response = await dio.post(
      url,
      options: Options(
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
        },
      ),
      data: jsonEncode({
        "model": "gpt-4o-mini",
        "messages": [
          {"role": "system", "content": "You are an AI assistant."},
          {
            "role": "user",
            "content":
                "Given that I am interested in $preferences provide a list of cities in $country that are best suited for these types of travel. The response should be a JSON array with city names and a brief reason why they are suitable. Response should not contain any other symbols, words, sentences except JSON."
          }
        ],
        "temperature": 0.2,
      }),
    );
    String jsonString = response.data["choices"][0]["message"]["content"];
    jsonString = jsonString.trim();
    if (jsonString.startsWith("```json")) {
      jsonString =
          jsonString.replaceAll("```json", "").replaceAll("```", "").trim();
    }

    return (jsonDecode(jsonString) as List)
        .map((city) => CityModel.fromJson(city))
        .toList();
  }
}
