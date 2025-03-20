import 'package:flutter/material.dart';
import 'package:jihc_hack/src/features/preferences/presentation/pages/choose_city_page.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  final TextEditingController _prefernecesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'Your Preferences',
            ),
            TextField(
              controller: _prefernecesController,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChooseCityPage(
                      preferences: _prefernecesController.text,
                    ),
                  ),
                );
              },
              child: Text('Choose preferences'),
            )
          ],
        ),
      ),
    );
  }
}
