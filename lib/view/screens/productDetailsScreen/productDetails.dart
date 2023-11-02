import 'package:ecommerce/controller/Cart/cartController.dart';
import 'package:ecommerce/controller/home/HomeNavigationController.dart';
import 'package:ecommerce/controller/productDetails/ProductController.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/functions/flushBar.dart';

import 'package:ecommerce/core/shared/BTN.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/productDetails/AppBarProductDetails.dart';
import '../../widgets/productDetails/ColorsandSizes.dart';
import '../../widgets/productDetails/TitleAndQuantity.dart';
import '../../widgets/productDetails/imageSlider.dart';

import '../../widgets/productDetails/productDesc.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  var x = Get.lazyPut(() => ProductDetailsControllerImp(), fenix: true);
  @override
  Widget build(BuildContext context) {
    CartControllerImp cartController = Get.put(CartControllerImp());
    HomeNavigationControllerImp homeNavigationControllerImp = Get.find();
    return Scaffold(
        backgroundColor: AppColors.white.withOpacity(0.93),
        body: GetBuilder<ProductDetailsControllerImp>(builder: (controller) {
          return SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView(children: [
                    const AppBarProductDetails(),
                    const imageSlider(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleAndQuantity(product: controller.product),
                          SizedBox(height: 10),
                          productDesc(),
                          SizedBox(height: 10),
                          ColorsandSizes(),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: BTN(
                                  widget: Text("Add to Cart",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  padding: 25,
                                  press: () async {
                                    if (controller
                                        .selectedProductColor.isNotEmpty) {
                                      await cartController.addToCart(
                                          productID:
                                              controller.product.productID,
                                          productName: controller.lang == "en"
                                              ? controller.product.productName
                                              : controller
                                                  .product.productNameAr,
                                          productDecs: controller.lang == "en"
                                              ? controller.product.productDesc
                                              : controller
                                                  .product.productDescAr,
                                          img: controller
                                              .product.productCoverImage,
                                          quantity: controller.productQuantity,
                                          color:
                                              controller.selectedProductColor,
                                          size: controller
                                                  .productVariationsSize[
                                              controller.selectedProductSize]);
                                      homeNavigationControllerImp
                                          .getCartlength();
                                    } else {
                                      flushBar(context,
                                          message:
                                              "Selecat Color & Size Please",
                                          color: Colors.redAccent);
                                    }
                                  },
                                  width: double.infinity,
                                  color: AppColors.primaryColor))
                        ])
                  ])));
        }));
  }
}
