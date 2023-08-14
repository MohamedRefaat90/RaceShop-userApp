import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/productDetails/ProductController.dart';
import '../../../core/functions/translate.dart';
import 'QuantityBTN.dart';
import 'QuantityNumber.dart';

class TitleAndQuantity extends GetView<ProductDetailsControllerImp> {
  const TitleAndQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
              translate(controller.product.productName,
                  controller.product.productNameAr),
              softWrap: true,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 25, height: 1.3)),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QuantityBTN(
                icon: Icons.add, press: () => controller.upProductQuantity()),
            GetBuilder<ProductDetailsControllerImp>(builder: (context) {
              return QuantityNumber(count: controller.productQuantity);
            }),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: QuantityBTN(
                  icon: Icons.minimize,
                  press: () => controller.downProductQuantity()),
            ),
          ],
        )
      ],
    );
  }
}
