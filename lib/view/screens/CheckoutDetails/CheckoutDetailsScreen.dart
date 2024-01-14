import 'package:race_shop/controller/checkout/checkout.dart';
import 'package:race_shop/core/shared/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/CheckoutDetails/CheckoutDetailsAddress.dart';
import '../../widgets/CheckoutDetails/CheckoutDetailsBill.dart';
import '../../widgets/CheckoutDetails/CheckoutDetailsItem.dart';

class CheckoutDetailsScreen extends GetView<CheckoutController> {
  const CheckoutDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return Scaffold(
      appBar: customAppBar(context, "CheckoutDetails".tr),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckoutDetailsItems(),
            CheckoutDetailsAddress(),
            CheckoutDetailsBill()
          ],
        ),
      ),
    );
  }
}
