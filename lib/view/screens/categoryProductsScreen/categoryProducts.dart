import 'package:race_shop/controller/CategoryProducts/CategoryProductsController.dart';
import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/constants/AppColors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/search/searchController.dart';
import '../../widgets/categoryProducts/CategoriesBar.dart';

import '../../widgets/categoryProducts/Filters.dart';
import '../../widgets/categoryProducts/Products.dart';
import '../../../core/shared/Searchbar_with_NotificationIcon.dart';
import '../SearchScreen/searchScreen.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryProductsControllerImp());

    return Scaffold(body: SafeArea(
        child: GetBuilder<CategoryProductsControllerImp>(builder: (controller) {
      return Column(children: [
        const Searchbar_with_NotificationIcon(),
        GetBuilder<SearchBarController>(builder: (searchController) {
          return searchController.isSearch
              ? SearchScreen()
              : Expanded(
                  child: Column(
                    children: [
                      const CategoriesBar(),
                      Filters(),
                      Expanded(
                          child: ListView(
                              controller: controller.scrollController,
                              shrinkWrap: true,
                              children: [
                            Products(),
                            (controller.loading == true &&
                                    controller.statusRequest !=
                                        StatusRequest.none)
                                ? SizedBox(
                                    height: 60,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                            color: AppColors.primaryColor)))
                                : controller.statusRequest == StatusRequest.none
                                    ? Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Center(
                                            child: Text("No More Products",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))))
                                    : SizedBox()
                          ])),
                    ],
                  ),
                );
        })
      ]);
    })));
  }
}
