import 'package:ecommerce/controller/CategoryProducts/CategoryProductsController.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constants/AppColors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/categoryProducts/CategoriesBar.dart';

import '../../widgets/categoryProducts/Filters.dart';
import '../../widgets/categoryProducts/Products.dart';
import '../../../core/shared/Searchbar_with_NotificationIcon.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryProductsControllerImp());

    return Scaffold(body: SafeArea(
        child: GetBuilder<CategoryProductsControllerImp>(builder: (controller) {
      return Column(children: [
        const Searchbar_with_NotificationIcon(),
        const CategoriesBar(),
        Filters(),
        Expanded(
            child: ListView(
                controller: controller.scrollController,
                shrinkWrap: true,
                children: [
              Products(),
              (controller.loading == true &&
                      controller.statusRequest != StatusRequest.none)
                  ? SizedBox(
                      height: 60,
                      child: Center(
                          child: CircularProgressIndicator(
                              color: AppColors.primaryColor)))
                  : controller.statusRequest == StatusRequest.none
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                              child: Text("No More Products",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))))
                      : SizedBox()
            ]))
      ]);
    })));
  }
}
