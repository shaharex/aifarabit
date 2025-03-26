import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/auth_gate.dart';
import 'package:jihc_hack/src/features/profile/presentation/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Профиль',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/astronavt.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Shohruh Rustamov',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'shoha@gmail.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            ProfileItem(
              text: 'Preferences',
              iconPath: 'settings',
              onTap: () {},
            ),
            ProfileItem(
              text: 'Account Security',
              iconPath: 'lock',
              onTap: () {},
            ),
            ProfileItem(
              text: 'Customer Support',
              iconPath: 'help',
              onTap: () {},
            ),
            ProfileItem(
              text: 'Logout',
              iconPath: 'logout',
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InitializePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
