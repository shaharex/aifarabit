import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/widgets/custom_button.dart';
import 'package:jihc_hack/src/core/widgets/custom_text_field.dart';
import 'package:jihc_hack/src/features/preferences/presentation/pages/choose_city_page.dart';
import 'package:jihc_hack/src/features/preferences/presentation/widgets/preferences_chip.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  final TextEditingController _prefernecesController = TextEditingController();

  List<bool> preferencesBool = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<String> preferencesList = [
    'Adventure',
    'Ecotourism',
    'Cultural',
    'Family',
    'Culinary',
    'Medical',
    'Leisure',
    'Educational',
    'Business',
    '+'
  ];

  List<String> choosedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ваши интересы',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                preferencesList.length,
                (index) => PreferencesChip(
                  text: preferencesList[index],
                  preferences: preferencesBool[index],
                  onTap: () {
                    if (index == preferencesList.length - 1) {
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return addPreferencesDialog(context);
                      //   },
                      // );
                    } else {
                      choosedList.add(preferencesList[index]);
                      setState(() {
                        preferencesBool[index] = !preferencesBool[index];
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: 'Выбрать',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChooseCityPage(preferences: choosedList),
                  ),
                );
              },
              textColor: Colors.white,
              btnColor: Colors.black,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  AlertDialog addPreferencesDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          const Text(
            'Добавить интерес',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 15),
          CustomTextField(
            hintText: 'Ваши интересы',
            controller: _prefernecesController,
            textChanged: (value) {},
            borderColor: const Color(0xff494949),
            prefixIcon: const Icon(
              Icons.room_preferences_outlined,
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            text: 'Добавить',
            onTap: () {
              preferencesList.add(_prefernecesController.text);
              preferencesBool.add(true);
              Navigator.pop(context);
              setState(() {});
            },
            textColor: Colors.white,
            btnColor: Colors.black,
            borderRadius: 20,
            width: null,
            height: 40,
          ),
          CustomButton(
            text: 'Отмена',
            onTap: () {
              Navigator.pop(context);
            },
            textColor: Colors.black,
            btnColor: Colors.white,
            borderRadius: 20,
            width: null,
            height: 40,
          )
        ],
      ),
    );
  }
}
