import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/data/Model/productModel.dart';
import 'package:ecommerce/view/widgets/home/homeTitle.dart';
import 'package:ecommerce/view/widgets/home/productsCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class productsSlider extends StatelessWidget {
  const productsSlider({super.key, required this.sliderTitle});
  final String sliderTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            homeTitle(title: sliderTitle),
            Spacer(),
            TextButton(
                child: Text("More"),
                onPressed: () => Get.toNamed(AppRoutes.offers))
          ],
        ),
        productsCard()
      ],
    );
  }
}
