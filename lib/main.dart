import 'package:flutter/material.dart';
import 'package:jihc_hack/src/features/navigation/presentation/pages/navigation_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationPage(),
      ),
    );
  }
}
