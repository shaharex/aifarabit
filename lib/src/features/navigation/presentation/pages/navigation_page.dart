import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        Center(
          child: Text("The first page"),
        ),
        Center(
          child: Text("The map page"),
        ),
        Center(
          child: Text("The third page"),
        ),
        Center(
          child: Text("The fourth page"),
        ),
      ][currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
              activeIcon: SvgPicture.asset('assets/icons/sel_history.svg'),
              icon: SvgPicture.asset('assets/icons/un_history.svg'),
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
