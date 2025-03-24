import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/constants/constants.dart';
import 'package:jihc_hack/src/core/widgets/custom_button.dart';
import 'package:jihc_hack/src/features/preferences/domain/entity/city.dart';
import 'package:jihc_hack/src/features/preferences/presentation/bloc/cities_bloc.dart';
import 'package:jihc_hack/src/features/preferences/presentation/widgets/city_info_item.dart';
import 'package:jihc_hack/src/features/preferences/presentation/widgets/widgets.dart';

class ChooseCityPage extends StatefulWidget {
  const ChooseCityPage({
    super.key,
    required this.preferences,
  });
  final List<String> preferences;

  @override
  State<ChooseCityPage> createState() => _ChooseCityPageState();
}

class _ChooseCityPageState extends State<ChooseCityPage> {
  final TextEditingController _cityController = TextEditingController();
  List<Map<String, String>> cities = [];
  bool isLoading = false;
  String dropdownCountry = 'Canada';
  List<String> countriesList = [
    'Canada',
    'France',
    'America',
    'Germany',
    'Denmark',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> fetchCities() async {
    setState(() => isLoading = true);
    try {
      cities = await getCanadianCities(
        widget.preferences.toString(),
        dropdownCountry,
      );
    } catch (e) {
      log("Error fetching cities: $e");
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CitiesBloc, CitiesState>(
              builder: (context, state) {
                return state.when(
                  initial: () => _buildInitialUI(context),
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.grey,
                      ),
                    ),
                  ),
                  success: (cities) => _buildCitiesList(cities),
                  failure: (message) => Text('Try Again: $message'),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCitiesList(List<City> cities) {
    return Expanded(
      child: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final city = cities[index];
          return CityItem(
            title: city.city,
            subtitle: city.description,
          );
        },
      ),
    );
  }

  Column _buildInitialUI(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Выберите Страну',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.inactiveColor,
          ),
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(10),
            value: dropdownCountry,
            hint: const Text('Выберите Страну'),
            icon: const Icon(Icons.arrow_downward),
            isExpanded: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            onChanged: (String? value) {
              setState(() {
                dropdownCountry = value!;
              });
            },
            items: countriesList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Ваши предпочтения:',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(
            widget.preferences.length,
            (index) => PreferencesChip(
              text: widget.preferences[index],
              preferences: true,
              onTap: () {},
            ),
          ),
        ),
        const SizedBox(height: 10),
        CustomButton(
          text: 'Продолжить',
          onTap: () {
            context.read<CitiesBloc>().add(
                  FetchCities(
                      preferences: widget.preferences.toString(),
                      country: dropdownCountry),
                );
          },
          textColor: Colors.white,
          btnColor: Colors.black,
        ),
        const SizedBox(height: 10),
      ],
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
              "Given that I am interested in $preferences provide a list of cities in $country that are best suited for these types of travel. The response should be a JSON array with city names and a brief reason why they are suitable. Response should not contain any other symbols, words, sentences except JSON."
        }
      ],
      "temperature": 0.2,
    }),
  );

  if (response.statusCode == 200) {
    String jsonString = response.data["choices"][0]["message"]["content"];
    jsonString = jsonString.trim();
    if (jsonString.startsWith("```json")) {
      jsonString =
          jsonString.replaceAll("```json", "").replaceAll("```", "").trim();
    }

    print(jsonString);
    return (jsonDecode(jsonString) as List)
        .map((item) => Map<String, String>.from(item))
        .toList();
  } else {
    throw Exception("Failed to get response: ${response.statusCode}");
  }
}
