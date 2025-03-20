import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/api_key.dart';

class ChooseCityPage extends StatefulWidget {
  const ChooseCityPage({
    super.key,
    required this.preferences,
  });
  final String preferences;

  @override
  State<ChooseCityPage> createState() => _ChooseCityPageState();
}

class _ChooseCityPageState extends State<ChooseCityPage> {
  final TextEditingController _cityController = TextEditingController();
  List<Map<String, String>> cities = [];
  bool isLoading = false;

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> fetchCities() async {
    setState(() => isLoading = true);
    try {
      cities =
          await getCanadianCities(widget.preferences, _cityController.text);
    } catch (e) {
      log("Error fetching cities: $e");
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose City')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text('Choose Country'),
            TextField(controller: _cityController),
            ElevatedButton(
              onPressed: fetchCities,
              child: Text('Choose country'),
            ),
            const SizedBox(height: 10),
            Text('Your Preferences: ${widget.preferences}'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Edit Preferences'),
            ),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: cities.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(cities[index]['city'] ?? ''),
                          subtitle: Text(cities[index]['reason'] ?? ''),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Map<String, String>>> getCanadianCities(
    String preferences, String country) async {
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
              "Given that I am interested in $preferences provide a list of cities in $country that are best suited for these types of travel. The response should be a JSON array with city names and a brief reason why they are suitable. Response should not contain any other symbols, words, sentences except JSON array with city names."
        }
      ],
      "temperature": 0.2,
    }),
  );

  if (response.statusCode == 200) {
    String jsonString = response.data["choices"][0]["message"]["content"];
    print(jsonString);
    jsonString = jsonString.trim();
    if (jsonString.startsWith("```json")) {
      jsonString =
          jsonString.replaceAll("```json", "").replaceAll("```", "").trim();
    }

    String data = jsonDecode(jsonString);
    print(data.runtimeType);

    return List<Map<String, String>>.from(jsonDecode(jsonString));
  } else {
    throw Exception("Failed to get response: ${response.statusCode}");
  }
}
