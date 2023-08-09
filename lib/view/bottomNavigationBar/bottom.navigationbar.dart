import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';
import 'package:inductus_jobs/view/homeScreen/homeScreen.dart';
import 'package:inductus_jobs/view/settingScreen/setting.screen.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    HomeScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: AppColors.navigationBarColor),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bookmark),
              label: 'Save',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gear),
              label: 'Setting',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.activeColor,
          onTap: _onItemTapped,
        ),
      ),
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
    );
  }
}
