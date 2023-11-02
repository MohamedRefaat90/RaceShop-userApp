import 'package:ecommerce/controller/checkout/checkout.dart';
import 'package:ecommerce/core/shared/customAppBar.dart';
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
      appBar: customAppBar(context, "Checkout Details"),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckoutDetailsAddress(),
          CheckoutDetailsBill(),
        ],
      ),
      body: CheckoutDetailsItems(),
    );
  }
}
