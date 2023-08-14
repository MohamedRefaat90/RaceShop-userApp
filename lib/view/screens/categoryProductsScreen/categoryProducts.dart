import 'package:ecommerce/controller/home/CategoryProductsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/categoryProducts/CategoriesBar.dart';

import '../../widgets/categoryProducts/Filters.dart';
import '../../widgets/categoryProducts/Products.dart';
import '../../../core/shared/Searchbar_with_NotificationIcon.dart';

class CategoryProducts extends GetView<CategoryProductsControllerImp> {
  const CategoryProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryProductsControllerImp());

    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const Searchbar_with_NotificationIcon(),
          const CategoriesBar(),
          Filters(),
          Products()
        ],
      )),
    );
  }
}
