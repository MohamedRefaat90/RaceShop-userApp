import 'package:ecommerce/view/screens/FavouriteScreen/FavouriteScreen.dart';
import 'package:ecommerce/view/screens/homeScreen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screens/SettingsScreen/SettingsScreen.dart';

abstract class HomeNavigationController extends GetxController {
  changePage(int currentPage);
}

class HomeNavigationControllerImp extends HomeNavigationController {
  int currentPage = 0;
  List<Widget> homeNavigationScreens = [
    const Home(),
    const SettingsScreen(),
    const FavouriteScreen(),
    const Column(
      children: [Center(child: Text("sdsdsdnflkanlkdnlk"))],
    )
  ];
  List<Map> homeNavigation = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Settings", "icon": Icons.settings},
    {"title": "Favorite", "icon": Icons.favorite},
    {"title": "Profile", "icon": Icons.person}
  ];

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
