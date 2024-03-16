import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:race_shop/controller/Favourite/FavouriteController.dart';
import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/shared/HandleingRequsetData.dart';

import '../../widgets/Favourites/FavouritesProducts.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavouriteControllerImp());
    return Scaffold(
      body: GetBuilder<FavouriteControllerImp>(builder: (controller) {
        return HandleingRequsetData(
            statusRequest: controller.statusRequest!,
            widget: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                      child: Text("Favourites".tr,
                          style: TextStyle(fontSize: 35))),
                ),
                (controller.statusRequest == StatusRequest.none ||
                        controller.favouriteProducts.isEmpty)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 350),
                        child: Center(
                            child: Text("No Products in your Favourit List",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))))
                    : FavouritesProducts()
              ],
            ));
      }),
    );
  }
}
