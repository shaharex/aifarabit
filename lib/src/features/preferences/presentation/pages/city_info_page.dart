import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/api_key.dart';

class CityInfoPage extends StatefulWidget {
  const CityInfoPage({
    super.key,
    required this.city,
    required this.country,
    required this.preferences,
  });
  final String city;
  final String country;
  final String preferences;

  @override
  State<CityInfoPage> createState() => _CityInfoPageState();
}

class _CityInfoPageState extends State<CityInfoPage> {
  Map<String, dynamic>? cityData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCityData();
  }

  Future<void> fetchCityData() async {
    try {
      cityData = await getCityData(
        city: widget.city,
        country: widget.country,
        preferences: widget.preferences,
      );
      log("this city Data: $cityData");
    } catch (e) {
      log("Error fetching city data: $e");
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.city)),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : cityData == null
              ? const Center(child: Text("No data available"))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text('So this is city name: \n ${cityData!['city']}'),
                      Text(
                          'So this is city name: \n ${cityData!['result']['hotel']}'),
                    ],
                  )),
    );
  }

  Widget _buildSectionTitle(String title, {double fontSize = 20}) {
    return Text(title,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold));
  }

  Widget _buildListTile(String? title, String? subtitle) {
    return ListTile(
      title: Text(title ?? ''),
      subtitle: Text(subtitle ?? ''),
    );
  }
}

final structure = {
  "city": "City Name",
  "result": {
    "hotel": [
      {
        "name": "Hotel Name",
        "price": "Price",
        "rating": "Rating",
        "address": "Hotel Address",
        "images": [
          {"image": "Hotel Image URL"}
        ]
      }
    ],
    "emergency": {
      "hospitals": [
        {"name": "Hospital Name", "address": "Hospital Address"}
      ]
    },
    "eat": [
      {
        "name": "Restaurant Name",
        "address": "Restaurant Address",
        "price": "Price",
        "rating": "Rating"
      }
    ],
    "types": {
      "historical": [
        {
          "name": "Attraction Name",
          "desc": "Description of the historical site.",
          "images": [
            {"image": "Attraction Image URL"}
          ]
        }
      ],
      "nature": [
        {
          "name": "Attraction Name",
          "desc": "Description of the nature site.",
          "images": [
            {"image": "Attraction Image URL"}
          ]
        }
      ],
      "sport": [
        {
          "name": "Attraction Name",
          "desc": "Description of the sports activity.",
          "images": [
            {"image": "Attraction Image URL"}
          ]
        }
      ],
      "entertain": [
        {
          "name": "Attraction Name",
          "desc": "Description of the entertainment venue.",
          "images": [
            {"image": "Attraction Image URL"}
          ]
        }
      ]
    },
    "services": {
      "taxi": "Taxi Service Name",
      "map": ["Map Service Name", "Map Icon URL", "App Download Link"]
    }
  }
};

Future<Map<String, dynamic>> getCityData({
  required String city,
  required String country,
  required String preferences,
}) async {
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
              "Provide detailed travel data in JSON format for $city in $country, considering $preferences. \nGenerate response strictly following this json structure: $structure. Response should not contain any other symbols, words, sentences except JSON array."
        }
      ],
      "temperature": 0.2,
    }),
  );

  if (response.statusCode == 200) {
    String jsonString =
        response.data["choices"][0]["message"]["content"].trim();
    if (jsonString.startsWith("```json")) {
      jsonString =
          jsonString.replaceAll("```json", "").replaceAll("```", "").trim();
    }
    print(jsonString);
    return jsonDecode(jsonString);
  } else {
    throw Exception("Failed to get response: \${response.statusCode}");
  }
}
