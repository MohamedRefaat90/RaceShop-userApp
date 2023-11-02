import 'package:ecommerce/controller/home/HomeNavigationController.dart';
import 'package:ecommerce/controller/search/searchController.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import '../../../core/functions/alertExitApp.dart';
import '../../widgets/home/HomeNavigationBar.dart';

class HomeNavigationScreen extends GetView<HomeNavigationControllerImp> {
  const HomeNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeNavigationControllerImp());
    Get.put(SearchBarController());
    // CartControllerImp cartController = Get.put(CartControllerImp());
    return GetBuilder<SearchBarController>(
        builder: (searchController) => Scaffold(
              extendBody: false,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniCenterDocked,
              floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
                  ? null
                  : GetBuilder<HomeNavigationControllerImp>(
                      builder: (controller) {
                      return badges.Badge(
                        badgeContent: Text(controller.cartLength.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white)),
                        badgeAnimation: badges.BadgeAnimation.scale(),
                        showBadge: controller.cartLength > 0,
                        child: FloatingActionButton(
                          onPressed: () => Get.toNamed(AppRoutes.cart),
                          backgroundColor: AppColors.secondryColor,
                          child: const Icon(Icons.shopping_basket_outlined),
                        ),
                      );
                    }),
              bottomNavigationBar: const HomeNavigationBar(),
              body: GetBuilder<HomeNavigationControllerImp>(builder: (context) {
                return WillPopScope(
                  onWillPop: () => AlertExitApp(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: controller
                        .homeNavigationScreens[controller.currentPage],
                  ),
                );
              }),
            ));
  }
}
