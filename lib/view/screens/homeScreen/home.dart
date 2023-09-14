import 'package:dartz/dartz.dart';
import 'package:ecommerce/controller/home/HomeController.dart';
import 'package:ecommerce/controller/search/searchController.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/functions/alertExitApp.dart';
import 'package:ecommerce/core/shared/HandleingRequsetData.dart';
import 'package:ecommerce/view/screens/SearchScreen/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/HomeNavigationController.dart';
import '../../widgets/home/CategoriesCards.dart';
import '../../../core/shared/Searchbar_with_NotificationIcon.dart';
import '../../widgets/home/offersBanar.dart';
import '../../widgets/home/productsSlider.dart';

class Home extends GetView<HomeControllerImp> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    Get.put(HomeNavigationControllerImp());
    Get.put(SearchBarController());
    return SafeArea(
      child: WillPopScope(
          onWillPop: () => AlertExitApp(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GetBuilder<HomeControllerImp>(builder: (HomeController) {
              return GetBuilder<SearchBarController>(
                  builder: (searchController) {
                return HandleingRequsetData(
                    statusRequest: HomeController.statusRequest!,
                    widget: ListView(shrinkWrap: true, children: [
                      const Searchbar_with_NotificationIcon(),
                      // const SizedBox(height: 10),
                      searchController.isSearch
                          ? SearchScreen()
                          : Column(children: [
                              const offersBanar(),
                              const SizedBox(height: 20),
                              const CategoriesCards(),
                              productsSlider(
                                  sliderTitle: 'productForYou'.tr,
                                  productCardColor:
                                      AppColors.black.withOpacity(0.5)),
                              productsSlider(
                                  sliderTitle: 'offerThisMonth'.tr,
                                  productCardColor:
                                      AppColors.secondryColor.withOpacity(0.7))
                            ])
                    ]));
              });
            }),
          )),
    );
  }
}
