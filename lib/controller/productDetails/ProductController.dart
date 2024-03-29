import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/dataSource/remote/Product/productData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/Model/productModel.dart';

abstract class ProductDetailsController extends GetxController {
  upProductQuantity();
  downProductQuantity();
  changeImageSliderIndicator(int index);
  changeSelectedProductColor(String ColorName, int Sizeindex);
  // productAddtoFav(productID);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late productModel product;
  late int? productIndex;
  int productQuantity = 1;
  int imagesSliderIndicator = 0;
  String selectedProductColor = "";
  int selectedProductSize = 0;
  MyServices myServices = Get.find();
  late String lang;
  late List productVariationsSize;
  bool isFav = true;
  StatusRequest? statusRequest;

  ProductsData productsData = ProductsData(Get.find());

  Map productColors = {
    "black": Colors.black,
    "white": Colors.white,
    "red": Colors.red,
    "blue": Colors.blue,
    "green": Colors.green,
    "yellow": Colors.yellow
  };

  @override
  void onInit() {
    product = Get.arguments['product'];
    productIndex = Get.arguments['index'];
    lang = myServices.sharedPreferences.getString('lang')!;
    productVariationsSize = product.productVariationsBySize!.keys.toList();
    super.onInit();
  }

  @override
  upProductQuantity() {
    productQuantity++;
    update();
  }

  @override
  downProductQuantity() {
    if (productQuantity > 1) {
      productQuantity--;
      update();
    }
  }

  @override
  changeImageSliderIndicator(index) {
    imagesSliderIndicator = index;
    update();
  }

  @override
  changeSelectedProductColor(ColorName, Sizeindex) {
    selectedProductColor = ColorName;
    selectedProductSize = Sizeindex;
    update();
  }
}
