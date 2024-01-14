import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/Model/productModel.dart';
import 'package:race_shop/data/dataSource/remote/Favourite/FavouriteData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/AppRoutes.dart';
import '../../core/functions/toast.dart';

abstract class FavouriteController extends GetxController {
  getFavProducts();
  setIsFav(String productID, bool isFav);
  productAddtoFav(String productID);
  productRemoveFromFav(String productID, {int? index});
  goToProductDetails(productModel product);
}

class FavouriteControllerImp extends FavouriteController {
  Map<String, bool> productsFav = {};
  StatusRequest? statusRequest;
  FavouriteData favouriteData = FavouriteData(Get.find());
  MyServices myServices = Get.find();
  late String userToken;
  List favouriteProducts = [];

  @override
  void onInit() {
    userToken = myServices.sharedPreferences.getString('userToken')!;
    getFavProducts();
    super.onInit();
  }

  // for UI
  @override
  setIsFav(String productID, bool isFav) {
    productsFav[productID] = isFav;
    update();
  }

  // for Database
  @override
  productAddtoFav(productID) {
    favouriteData.addToFav(productID, userToken);
    toastAlert(msg: 'Product Added to Favourite List', color: Colors.green);
  }

  @override
  productRemoveFromFav(productID, {index}) {
    if (favouriteProducts.isEmpty) {
      statusRequest = StatusRequest.failure;
    }
    favouriteData.removeFromFav(productID, userToken);

    favouriteProducts.removeAt(index!);

    toastAlert(
        msg: 'Product Removerd From Favourite List', color: Colors.redAccent);

    update();
  }

  @override
  goToProductDetails(product) {
    Get.toNamed(AppRoutes.productDetails, arguments: {'product': product});
  }

  @override
  getFavProducts() async {
    favouriteProducts.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await favouriteData.getFavProducts(userToken);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        favouriteProducts = response['data']['data'];
      }
    } else {
      statusRequest = StatusRequest.none;
    }
    update();
  }
}
