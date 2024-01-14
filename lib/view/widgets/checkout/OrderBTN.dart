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
                  : Text("Order".tr),
              width: double.infinity,
              press: () async {
                if (controller.SelectedPaymentMethod.isNotEmpty &&
                    controller.SelectedAddress != null) {
                  if (controller.SelectedPaymentMethod == "cash") {
                    await controller.checkoutCash(
                        cartController.coupon == null
                            ? ""
                            : cartController.coupon!.name,
                        context);
                    controller.getTotalDiscount();
                  } else {
                    await controller.checkoutOnline(
                        cartController.coupon == null
                            ? ""
                            : cartController.coupon!.name);
                    controller.getTotalDiscount();
                  }
                } else {
                  flushBar(context,
                      message: "YouMustChooseDeliveryAddress&PaymentMethod".tr,
                      color: Colors.red);
                }
              }),
        );
      }),
    );
  }
}
