import 'package:ecommerce/controller/home/HomeNavigationController.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/home/HomeNavigationBar.dart';

class HomeNavigationScreen extends StatelessWidget {
  const HomeNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeNavigationControllerImp());
    return GetBuilder<HomeNavigationControllerImp>(
        builder: (controller) => Scaffold(
              extendBody: true,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                onPressed: () => Get.toNamed(AppRoutes.cart),
                backgroundColor: AppColors.secondryColor,
                child: const Icon(Icons.shopping_basket_outlined),
              ),
              bottomNavigationBar: const HomeNavigationBar(),
              body: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: controller.homeNavigationScreens[controller.currentPage],
              ),
            ));
  }
}
