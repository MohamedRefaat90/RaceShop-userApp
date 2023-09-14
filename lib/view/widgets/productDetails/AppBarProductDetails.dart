import 'package:ecommerce/controller/Favourite/FavouriteController.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/productDetails/ProductController.dart';
import 'AppBarIcon.dart';

class AppBarProductDetails extends GetView<ProductDetailsControllerImp> {
  const AppBarProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<ProductDetailsControllerImp>();
    FavouriteControllerImp FavController = Get.put(FavouriteControllerImp());
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      AppBarIcon(
          alignment: controller.lang == 'ar'
              ? Alignment.centerRight
              : Alignment.centerLeft,
          x: controller.lang == 'ar' ? -19 : 19,
          press: () {
            Get.back(closeOverlays: true);
            // controller.dispose();
          },
          icon: Icons.arrow_back,
          color: AppColors.black),
      GetBuilder<FavouriteControllerImp>(builder: (context) {
        return AppBarIcon(
            alignment: controller.lang == 'ar'
                ? Alignment.centerLeft
                : Alignment.centerRight,
            x: controller.lang == 'ar' ? 19 : -19,
            press: () {
              if (FavController.productsFav[controller.product.productID] ==
                  true) {
                FavController.setIsFav(controller.product.productID, false);
                FavController.productRemoveFromFav(controller.product.productID,
                    index: controller.productIndex);
              } else {
                FavController.setIsFav(controller.product.productID, true);
                FavController.productAddtoFav(controller.product.productID);
              }
            },
            icon:
                FavController.productsFav[controller.product.productID] == true
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
            color: Colors.red);
      })
    ]);
  }
}
