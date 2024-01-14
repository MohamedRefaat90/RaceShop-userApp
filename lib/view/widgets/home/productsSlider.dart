import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/data/Model/productModel.dart';
import 'package:race_shop/view/widgets/home/homeTitle.dart';
import 'package:race_shop/view/widgets/home/productsCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/Responsive.dart';

class productsSlider extends StatelessWidget {
  const productsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Offers'.tr,
                style: TextStyle(
                    fontSize: screenWidth(context) * 0.085,
                    fontFamily: "Cairo")),
            Spacer(),
            TextButton(
                child: Text("More".tr),
                onPressed: () => Get.toNamed(AppRoutes.offers))
          ],
        ),
        productsCard()
      ],
    );
  }
}
