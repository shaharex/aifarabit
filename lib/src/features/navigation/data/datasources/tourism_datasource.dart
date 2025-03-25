import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jihc_hack/src/core/constants/constants.dart';
import 'package:jihc_hack/src/core/utils/structure_util.dart';
import 'package:jihc_hack/src/features/navigation/data/models/tourism.dart';

class TourismDatasource {
  Future<TourismData> getTourismData(
      String city, String country, String preferences) async {
    const apiKey = '';
    const String url = "https://api.openai.com/v1/chat/completions";
    var structure = StructureUtilHelper.structure;

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
                "Provide detailed travel data in JSON format for $city in $country, considering $preferences. \nGenerate response strictly following this json structure, there can be up to 5 hotels, 5 attractions, 5 restaurants: $structure. Response should not contain any other symbols, words, sentences except JSON array."
          }
        ],
        "temperature": 0.2,
      }),
    );

    String jsonString =
        response.data["choices"][0]["message"]["content"].trim();
    if (jsonString.startsWith("```json")) {
      jsonString =
          jsonString.replaceAll("```json", "").replaceAll("```", "").trim();
    }
    print(jsonString);
    return TourismData.fromJson(jsonDecode(jsonString));
  }
}
