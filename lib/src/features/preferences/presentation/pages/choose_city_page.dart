import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/hive/hive_serv.dart';
import 'package:jihc_hack/src/core/widgets/custom_button.dart';
import 'package:jihc_hack/src/features/navigation/presentation/pages/navigation_page.dart';
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
    'Kazakhstan',
    'Russia',
    'Uzbekistan',
    'Tajikistan',
    'Kyrgyzstan',
    'Turkey',
    'Azerbaijan',
    'Georgia',
    'Brazil',
    'Argentina',
    'Mexico',
    'Colombia',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
      child: ListView.separated(
        itemCount: cities.length,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemBuilder: (context, index) {
          final city = cities[index];
          return CityItem(
            imagePath: 'assets/city.jpg',
            title: city.city,
            subtitle: city.description,
            onTap: () {
                HiveService.saveUser(
                  '',
                  city.city,
                  widget.preferences,
                  dropdownCountry
                );
                HiveService.clearTourismData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationPage(),
                  ),
                );
              },
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
