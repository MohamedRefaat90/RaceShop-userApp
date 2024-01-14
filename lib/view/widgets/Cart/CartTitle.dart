import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/AppColors.dart';

class CartTitle extends StatelessWidget {
  const CartTitle({super.key, required this.numofItems});
  final int numofItems;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "YouHave".tr),
        TextSpan(
            text: "$numofItems ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.secondryColor,
                fontSize: 20)),
        TextSpan(text: "iteminYourCart".tr)
      ])),
    );
  }
}
