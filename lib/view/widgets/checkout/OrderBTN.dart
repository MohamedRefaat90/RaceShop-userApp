import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Cart/cartController.dart';
import '../../../controller/checkout/checkout.dart';
import '../../../core/class/statusRequest.dart';
import '../../../core/constants/AppColors.dart';
import '../../../core/functions/flushBar.dart';
import '../../../core/shared/BTN.dart';

class OrderBTN extends GetView<CheckoutController> {
  const OrderBTN({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp cartController = Get.put(CartControllerImp());
    return Center(
      child: GetBuilder<CheckoutController>(builder: (controller) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: controller.statusRequest == StatusRequest.loading ? 60 : 350,
          height: controller.statusRequest == StatusRequest.loading ? 60 : 55,
          child: BTN(
              widget: controller.statusRequest == StatusRequest.loading
                  ? CircularProgressIndicator(
                      color: AppColors.white, strokeWidth: 4)
                  : Text("Order"),
              width: double.infinity,
              press: () {
                if (controller.SelectedPaymentMethod.isNotEmpty &&
                    controller.SelectedAddress != null) {
                  if (controller.SelectedPaymentMethod == "cash") {
                    // print(controller.SelectedAddress!);
                    // print(controller.deliveryZone!['_id']);
                    // print(cartController.coupon == null
                    //     ? ""
                    //     : cartController.coupon!.name);
                    controller.checkoutCash(cartController.coupon == null
                        ? ""
                        : cartController.coupon!.name);
                  } else {
                    controller.checkoutOnline(cartController.coupon == null
                        ? ""
                        : cartController.coupon!.name);
                  }
                } else {
                  flushBar(context,
                      message:
                          "You Must Choose Delivery Address & Payment Method",
                      color: Colors.red);
                }
              }),
        );
      }),
    );
  }
}
