import 'package:ecommerce/view/widgets/home/homeTitle.dart';
import 'package:ecommerce/view/widgets/home/productsCard.dart';
import 'package:flutter/material.dart';

class productsSlider extends StatelessWidget {
  const productsSlider({
    super.key,
    required this.sliderTitle,
    required this.productCardColor,
  });
  final String sliderTitle;
  final Color productCardColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        homeTitle(title: sliderTitle),
        productsCard(productCardColor: productCardColor)
      ],
    );
  }
}
