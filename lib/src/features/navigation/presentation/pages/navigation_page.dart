import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ai_farabi/src/core/constants/app_colors.dart';
import 'package:ai_farabi/src/features/map/map_page.dart';
import 'package:ai_farabi/src/features/navigation/presentation/pages/main_page.dart';
import 'package:ai_farabi/src/features/profile/presentation/pages/profile_page.dart';
import 'package:ai_farabi/src/features/transtator/translation_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        MainPage(),
        MapPickPage(latLng: LatLng(0, 0)),
        TranslationPage(),
        ProfilePage(),
      ][currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/un_home.svg'),
              activeIcon: SvgPicture.asset('assets/icons/sel_home.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/icons/sel_map.svg'),
              icon: SvgPicture.asset('assets/icons/un_map.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.translate, color: AppColors.iconsColor),
              icon: Icon(Icons.translate, color: Colors.black38),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/icons/sel_person.svg'),
              icon: SvgPicture.asset('assets/icons/un_person.svg'),
              label: '',
            ),
          ]),
    );
  }
}
