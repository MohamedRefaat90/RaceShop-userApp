import 'package:ecommerce/controller/Favourite/FavouriteController.dart';
import 'package:ecommerce/core/shared/HandleingRequsetData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/Searchbar_with_NotificationIcon.dart';
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
                Searchbar_with_NotificationIcon(),
                FavouritesProducts()
              ],
            ));
      }),
    );
  }
}
