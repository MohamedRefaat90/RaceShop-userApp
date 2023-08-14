import 'package:ecommerce/view/widgets/productDetails/productColorDot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/productDetails/ProductController.dart';

class ColorsandSizes extends GetView<ProductDetailsControllerImp> {
  const ColorsandSizes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ColorsandSizes'.tr,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ListView.builder(
            shrinkWrap: true,
            itemCount: controller.product.productVariationsBySize!.length,
            itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.productVariationsSize[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                      Row(
                          children: List.generate(
                              controller
                                  .product
                                  .productVariationsBySize![
                                      controller.productVariationsSize[index]]
                                  .length,
                              (i) => productColorDot(
                                  color: controller.productColors[controller
                                              .product.productVariationsBySize![
                                          controller
                                              .productVariationsSize[index]][i]
                                      ['color']]!,
                                  colorIndex: i,
                                  sizeIndex: index)))
                    ])),
      ],
    );
  }
}
