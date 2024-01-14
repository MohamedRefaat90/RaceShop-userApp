import 'package:race_shop/controller/home/HomeController.dart';
import 'package:race_shop/controller/search/searchController.dart';
import 'package:race_shop/core/functions/Responsive.dart';
import 'package:race_shop/core/shared/HandleingRequsetData.dart';
import 'package:race_shop/view/screens/SearchScreen/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/HomeNavigationController.dart';
import '../../../controller/settings/SettingsController.dart';
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
    // Get.put(SettingsController());
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<HomeControllerImp>(builder: (HomeController) {
          return GetBuilder<SearchBarController>(builder: (searchController) {
            return HandleingRequsetData(
                statusRequest: HomeController.statusRequest!,
                widget: ListView(shrinkWrap: true, children: [
                  const Searchbar_with_NotificationIcon(),
                  searchController.isSearch
                      ? SearchScreen()
                      : Column(children: [
                          const offersBanar(),
                          const SizedBox(height: 20),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Categories".tr,
                                    style: TextStyle(
                                        fontSize: screenWidth(context) * 0.085,
                                        fontFamily: "Cairo")),
                                SizedBox(height: 10),
                                const CategoriesCards()
                              ]),
                          productsSlider(),
                        ])
                ]));
          });
        }),
      ),
    );
  }
}
