// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PageIndex {
  PageIndex._();
  static List<PageInfor> navBar = [
    PageInfor(
        name: "Home",
        title: "title",
        icon: const Icon(Icons.apps),
        activeIcon: const Icon(Icons.apps_outlined)),
    PageInfor(
        name: "Activity",
        title: "title",
        icon: const Icon(Icons.bar_chart_outlined),
        activeIcon: const Icon(Icons.bar_chart_rounded)),
    PageInfor(
        name: "Discover",
        title: "title",
        icon: const Icon(Icons.search_outlined),
        activeIcon: const Icon(Icons.search_rounded)),
    PageInfor(
        name: "Profile",
        title: "title",
        icon: const Icon(Icons.person_2_outlined),
        activeIcon: const Icon(Icons.person_2_rounded)),
  ];
}

class PageInfor {
  late String name;
  late String title;
  late Icon activeIcon;
  late Icon icon;
  PageInfor({
    required this.name,
    required this.title,
    required this.activeIcon,
    required this.icon,
  });
}
