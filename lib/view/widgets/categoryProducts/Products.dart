import 'package:ecommerce/data/Model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../controller/home/CategoryProductsController.dart';
import '../../../controller/Favourite/FavouriteController.dart';
import '../../../core/shared/HandleingRequsetData.dart';
import 'CategoryProductCard.dart';

class Products extends GetView<CategoryProductsControllerImp> {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryProductsControllerImp());
    FavouriteControllerImp FavController = Get.put(FavouriteControllerImp());

    return GetBuilder<CategoryProductsControllerImp>(builder: (controller) {
      return HandleingRequsetData(
          statusRequest: controller.statusRequest,
          widget: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.9),
              itemCount: controller.categoryProducts.length,
              itemBuilder: (context, index) {
                FavController.productsFav[
                        controller.categoryProducts[index].productID] =
                    controller.categoryProducts[index].productIsFav;
                return CategoryProductCard(
                    index: index, product: controller.categoryProducts[index]);
              }));
    });
  }
}
