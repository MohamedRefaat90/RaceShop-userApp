import 'package:ecommerce/controller/productDetails/ProductController.dart';
import 'package:ecommerce/core/constants/AppColors.dart';

import 'package:ecommerce/core/shared/BTN.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/productDetails/AppBarProductDetails.dart';
import '../../widgets/productDetails/ColorsandSizes.dart';
import '../../widgets/productDetails/TitleAndQuantity.dart';
import '../../widgets/productDetails/imageSlider.dart';

import '../../widgets/productDetails/productDesc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
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
                          const TitleAndQuantity(),
                          productDesc(),
                          SizedBox(height: 10),
                          ColorsandSizes(),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: BTN(
                                  lable: "Add to Cart",
                                  padding: 25,
                                  press: () {},
                                  width: double.infinity,
                                  color: AppColors.primaryColor))
                        ])
                  ])));
        }));
  }
}
