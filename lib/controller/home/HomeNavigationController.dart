import 'package:race_shop/data/dataSource/remote/Orders/OrdersData.dart';
import 'package:race_shop/view/screens/FavouriteScreen/FavouriteScreen.dart';
import 'package:race_shop/view/screens/OrdersScreen/OrdersScreen.dart';
import 'package:race_shop/view/screens/homeScreen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/services/myServices.dart';
import '../../data/dataSource/remote/Cart/CartData.dart';
import '../../view/screens/SettingsScreen/SettingsScreen.dart';

abstract class HomeNavigationController extends GetxController {
  changePage(int currentPage);
}

class HomeNavigationControllerImp extends HomeNavigationController {
  List<Widget> homeNavigationScreens = [
    const Home(),
    const SettingsScreen(),
    const FavouriteScreen(),
    const OrdersScreen()
  ];
  List<Map> homeNavigation = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Settings", "icon": Icons.settings},
    {"title": "Favorite", "icon": Icons.favorite},
    {"title": "Orders", "icon": Icons.shopping_bag}
  ];
  int currentPage = 0;
  late num cartLength;
  String? userToken;
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  CartData cartData = CartData(Get.find());
  OrdersData ordersData = OrdersData(Get.find());

  @override
  void onInit() {
    userToken = myServices.sharedPreferences.getString('userToken');
    getCartlength();
    super.onInit();
  }

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }

  getCartlength() async {
    cartLength = 0;
    var response = await cartData.getCartProducts(userToken!);
    var data = response['data']['data'];
    for (int i = 0; i < data['items'].length; i++) {
      cartLength = cartLength + data['items'][i]['quantity'];
    }
    update();
  }
}
