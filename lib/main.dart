import 'package:flutter/material.dart';
import 'package:jihc_hack/src/features/ai_farabi/presentation/pages/chat_page.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/auth_gate.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/login_page.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/register_page.dart';
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
      home: ChatPage(
        place: "АЙша Биби",
      ),
    );
  }
}
