import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/features/map/presentation/page/map_page.dart';
import 'package:jihc_hack/src/features/navigation/presentation/pages/city_info_page.dart';
import 'package:jihc_hack/src/features/navigation/presentation/pages/main_page.dart';
import 'package:jihc_hack/src/features/transtator/translation_page.dart';

import '../../../profile/presentation/pages/profile_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        CityInfoPage(),
        MapPickPage(latLng: LatLng(0, 0)),
        TranslationPage(),
        ProfilePage(),
      ][currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          type: BottomNavigationBarType.fixed,
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
              activeIcon: SvgPicture.asset('assets/icons/translator.svg'),
              icon: SvgPicture.asset(
                'assets/icons/translator.svg',
                color: const Color(0xff9E9E9E),
              ),
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
