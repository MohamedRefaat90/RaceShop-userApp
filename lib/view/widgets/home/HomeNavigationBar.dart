import 'package:race_shop/controller/Favourite/FavouriteController.dart';
import 'package:race_shop/controller/orders/ordersController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/HomeNavigationController.dart';
import '../../../core/constants/AppColors.dart';
import 'bottomBarBTN.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeNavigationControllerImp());
    FavouriteControllerImp FavCon = Get.put(FavouriteControllerImp());
    ordersController os = Get.put(ordersController());
    return GetBuilder<HomeNavigationControllerImp>(
        builder: (controller) => BottomAppBar(
            height: 70,
            color: AppColors.black.withOpacity(0.8),
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  controller.homeNavigationScreens.length + 1,
                  (index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : bottomBarBTN(
                            title: controller.homeNavigation[i]['title'],
                            icon: controller.homeNavigation[i]['icon'],
                            isActive:
                                controller.currentPage == i ? true : false,
                            press: () {
                              controller.changePage(i);

                              if (i == 2) {
                                FavCon.getFavProducts();
                              }

                              if (i == 3) {
                                os.getAllOrders();
                              }
                            });
                  },
                ))));
  }
}
