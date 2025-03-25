import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jihc_hack/src/core/constants/api_key.dart';
import 'package:jihc_hack/src/features/navigation/presentation/bloc/tourism_bloc.dart';

class CityInfoPage extends StatefulWidget {
  const CityInfoPage({
    super.key,
    // required this.city,
    // required this.country,
    // required this.preferences,
  });
  // final String city;
  // final String country;
  // final String preferences;

  @override
  State<CityInfoPage> createState() => _CityInfoPageState();
}



class _CityInfoPageState extends State<CityInfoPage> {
  Map<String, dynamic>? cityData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: GestureDetector(
        onTap: () {
          context.read<TourismBloc>().add(GetTourismData(country: 'France', city: 'Lyon', preferences: 'history, adventure, educational, museums, old vibes'));
        },
        child: Text('where is tourism data'),)),
      body: BlocBuilder<TourismBloc, TourismState>(builder: (context, state) {
        return state.when(
          initial: () => Text('Init State botrthe'),
          loading: () =>  Center(child: CircularProgressIndicator()),
          success: (tourismData) => Text('This is tourism data: $tourismData'),
          failure: (message) => Text('this is error: $message'),
        );
      }),
    );
  }
}

final structure = {
  {
    "city": "City Name",
    "hotels": [
      {
        "name": "Hotel Name",
        "price": "Price",
        "rating": "Rating",
        "address": "Hotel Address",
        "images": ["Hotel Image URL"]
      }
    ],
    "hospitals": [
      {
        "name": "Hospital Name",
        "address": "Hospital Address",
      }
    ],
    "restaurants": [
      {
        "name": "Restaurant Name",
        "address": "Restaurant Address",
        "price": "Price",
        "rating": "Rating"
      }
    ],
    "attractions": [
      {
        "name": "Attraction Name",
        "desc": "Description",
        "type": "historical",
        "images": ["Real Attraction Image URL"]
      }
    ],
    "services": {
      "taxi": {
        "name": "Taxi Service Name",
        "link": "App Download Link",
      },
      "map": {
        "name": "Map Service Name",
        "link": "App Download Link",
      }
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
              "Provide detailed travel data in JSON format for $city in $country, considering $preferences. \nGenerate response strictly following this json structure, there can be up to 5 hotels, 5 attractions, 5 restaurants: $structure. Response should not contain any other symbols, words, sentences except JSON array."
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
