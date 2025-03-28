import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/hive/hive_serv.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/login_page.dart';
import 'package:jihc_hack/src/features/navigation/presentation/pages/navigation_page.dart';

class InitializePage extends StatelessWidget {
  const InitializePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null || HiveService.getUsername() == '') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavigationPage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      });
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.iconsColor,
          valueColor: const AlwaysStoppedAnimation<Color>(
            Colors.grey,
          ),
        ),
      ),
    );
  }
}
