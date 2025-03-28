import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/hive/hive_serv.dart';
import 'package:jihc_hack/src/core/widgets/widgets.dart';
import 'package:jihc_hack/src/features/auth/presentation/pages/auth_gate.dart';
import 'package:jihc_hack/src/features/profile/presentation/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';
  String email = '';
  TextEditingController usernameController = TextEditingController();
  @override
  void initState() {
    getUsername();
    super.initState();
  }

  getUsername() async {
    final newUsername = await HiveService.getUsername();
    final newEmail = FirebaseAuth.instance.currentUser?.email ?? '';
    
    setState(() {
      username = newUsername;
      email = newEmail;
      usernameController.text = newUsername;
    });
  }

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
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: true,
                enableDrag: true,
                context: context, builder: (context) => 
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    CustomTextField(
                      hintText: 'Username', 
                      controller: usernameController, 
                      textChanged: (_){}, 
                      prefixIcon: Icon(Icons.person, color: AppColors.iconsColor,),
                    ),
                    SizedBox(height: 20,),
                    CustomButton(
                      text: 'Save',
                      onTap: () { 
                        if (usernameController.text.isNotEmpty) {
                          HiveService.updateUsername(usernameController.text);
                          setState(() {
                            username = usernameController.text;
                          });
                          Navigator.pop(context);
                        }
                       },
                      btnColor: AppColors.iconsColor,
                      textColor: Colors.white,
                    )
                  ],
                ),
              ));
            },
            icon: const Icon(Icons.edit),
          ),
        ],
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
              username,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              email,
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
                await HiveService.clearUser();
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
