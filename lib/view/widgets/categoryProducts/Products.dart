import 'package:ecommerce/data/Model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/CategoryProductsController.dart';
import '../../../controller/Favourite/FavouriteController.dart';
import '../../../core/shared/HandleingRequsetData.dart';
import 'CategoryProductCard.dart';

class Products extends GetView<CategoryProductsControllerImp> {
  const Products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FavouriteControllerImp FavController = Get.put(FavouriteControllerImp());
    return GetBuilder<CategoryProductsControllerImp>(builder: (context) {
      return HandleingRequsetData(
          statusRequest: controller.statusRequest!,
          widget: GridView.builder(
            itemCount: controller.categoryProducts.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9),
            itemBuilder: (context, index) {
              FavController
                      .productsFav[controller.categoryProducts[index]['id']] =
                  controller.categoryProducts[index]['favourite'];

              return CategoryProductCard(
                index: index,
                product:
                    productModel.formjson(controller.categoryProducts[index]),
              );
            },
          ));
    });
  }
}
