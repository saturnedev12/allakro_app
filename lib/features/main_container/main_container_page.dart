import 'package:allakroapp/features/actor_page/actor_page.dart';
import 'package:allakroapp/features/home_page/home_page.dart';
import 'package:allakroapp/features/ill_page/illness_page.dart';
import 'package:allakroapp/features/residence/residence_page.dart';
import 'package:allakroapp/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../activity_page/activity_page.dart';
import '../actuality_page/actuality_page.dart';
import '../health_page/health_page.dart';
import '../statistics/statistics_page.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ActorPage(),
    ActivityPage(),
    ActualityPage(),
    IllnessPage(),
    HeathPage(),
    StatisticsPage(),
    ResidencePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        selectedItemColor: Colors.green,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Assets.iconsSvg.homeNav.svg(
                color: (_selectedIndex == 0) ? Colors.green : Colors.black,
                height: 25,
                width: 25),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Assets.iconsSvg.actorsNav.svg(
                color: (_selectedIndex == 1) ? Colors.green : Colors.black,
                height: 25,
                width: 25),
            label: 'Acteurs',
          ),
          BottomNavigationBarItem(
            icon: Assets.iconsSvg.activityNav.svg(
                color: (_selectedIndex == 2) ? Colors.green : Colors.black,
                height: 25,
                width: 25),
            label: 'Activités',
          ),
          BottomNavigationBarItem(
            icon: Assets.iconsSvg.actualityNav.svg(
                color: (_selectedIndex == 3) ? Colors.green : Colors.black,
                height: 25,
                width: 25),
            label: 'Actualités',
          ),
          BottomNavigationBarItem(
            icon: Assets.iconsSvg.illsNav.svg(
                color: (_selectedIndex == 4) ? Colors.green : Colors.black,
                height: 25,
                width: 25),
            label: 'Maladies',
          ),
          BottomNavigationBarItem(
            icon: Assets.iconsSvg.healthsNav.svg(
                color: (_selectedIndex == 5) ? Colors.green : Colors.black,
                height: 25,
                width: 25),
            label: 'Santé',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.house_fill,
              color: (_selectedIndex == 6) ? Colors.green : Colors.black,
              size: 28,
            ),
            label: 'domicile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chart_bar_square,
              color: (_selectedIndex == 7) ? Colors.green : Colors.black,
              size: 30,
            ),
            label: 'Statistics',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
