import 'package:race_shop/controller/orderDetails/orderDetailsController.dart';
import 'package:race_shop/core/shared/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/orderDetails/orderDetailsAddress.dart';
import '../../widgets/orderDetails/orderDetailsItems.dart';

class OrderDetailsScreen extends GetView<orderDetailsController> {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(orderDetailsController());
    return Scaffold(
      appBar: customAppBar(context, "OrderDetails".tr),
      bottomNavigationBar: OrderDetailsAddress(),
      body: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: OrderDetailsItems()),
    );
  }
}
