import 'package:flutter/material.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/auth_page.dart';
import 'package:jihc_hack/src/features/map/presentation/page/map_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapPickPage(),
    );
  }
}
