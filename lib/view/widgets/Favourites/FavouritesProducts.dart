import 'package:race_shop/data/Model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Favourite/FavouriteController.dart';
import 'FavouriteProductCard.dart';

class FavouritesProducts extends StatelessWidget {
  const FavouritesProducts({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavouriteControllerImp());
    return GetBuilder<FavouriteControllerImp>(builder: (controller) {
      return GridView.builder(
          itemCount: controller.favouriteProducts.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.9),
          itemBuilder: (context, index) {
            return FavouriteProductCard(
                product:
                    productModel.formjson(controller.favouriteProducts[index]),
                index: index);
            // return null;

            // return null;
          });
    });
  }
}
