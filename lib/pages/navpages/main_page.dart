import 'package:dulich/constants/colors.dart';
import 'package:dulich/constants/page_index.dart';
import 'package:dulich/pages/navpages/activity.dart';
import 'package:dulich/pages/navpages/discover.dart';
import 'package:dulich/pages/navpages/home.dart';
import 'package:dulich/pages/navpages/profile.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var pages = [Home(), const Activity(), Discover(), Profile()];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          onTap: onTap,
          items: List.generate(PageIndex.navBar.length, (index) {
            var page = PageIndex.navBar[index];
            return BottomNavigationBarItem(
                label: page.name,
                icon: page.icon,
                backgroundColor: AppColors.white);
          })),
    );
  }
}
