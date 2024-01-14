import 'package:race_shop/controller/home/HomeController.dart';
import 'package:race_shop/view/widgets/Offers/OffersProductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/Favourite/FavouriteController.dart';
import '../../../core/shared/HandleingRequsetData.dart';

class OffersProducts extends StatelessWidget {
  const OffersProducts({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteControllerImp FavController = Get.put(FavouriteControllerImp());

    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return HandleingRequsetData(
          statusRequest: controller.statusRequest!,
          widget: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.9),
              itemCount: controller.offersProducts.length,
              itemBuilder: (context, index) {
                FavController.productsFav[controller.offersProducts[index]
                    .productID] = controller.offersProducts[index].productIsFav;
                return OffersProductCard(
                    index: index, product: controller.offersProducts[index]);
              }));
    });
  }
}
