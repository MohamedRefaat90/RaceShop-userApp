import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/productDetails/ProductController.dart';
import '../../../core/functions/translate.dart';

class productDesc extends GetView<ProductDetailsControllerImp> {
  const productDesc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        translate(
            controller.product.productDesc, controller.product.productDescAr),
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16));
  }
}
