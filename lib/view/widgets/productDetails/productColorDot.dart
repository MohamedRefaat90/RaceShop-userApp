import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/productDetails/ProductController.dart';
import '../../../core/constants/AppColors.dart';

class productColorDot extends GetView<ProductDetailsControllerImp> {
  const productColorDot({
    required this.color,
    required this.colorIndex,
    required this.sizeIndex,
    super.key,
  });
  final Color color;
  final int colorIndex;
  final int sizeIndex;
  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return InkWell(
      onTap: () {
        controller.changeSelectedProductColor(colorIndex, sizeIndex);
      },
      child: Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: color,
              border: (controller.selectedProductColor == colorIndex &&
                      controller.selectedProductSize == sizeIndex)
                  ? Border.all(width: 2, color: AppColors.black)
                  : null)),
    );
  }
}
