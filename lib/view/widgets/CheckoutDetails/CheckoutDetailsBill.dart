import 'package:race_shop/controller/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/functions/ThemeColorFix.dart';

import '../../../core/constants/AppColors.dart';
import '../../../core/shared/BTN.dart';

class CheckoutDetailsBill extends GetView<CheckoutController> {
  const CheckoutDetailsBill({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());

    return DefaultTextStyle(
      style: TextStyle(fontSize: 18, color: ThemeColorFix()),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            height: controller.checkout.coupon != null ? 355 : 325,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 3),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 20)
                .copyWith(top: 10, bottom: 10),
            child: Column(
              children: [
                Text("Bill".tr,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 5),
                Row(children: [
                  Text('Price'.tr),
                  Spacer(),
                  Text("${controller.checkout.totalItemsPrice} LE")
                ]),
                if (controller.checkout.coupon != null)
                  Row(children: [
                    SizedBox(height: 5),
                    Text.rich(TextSpan(children: [
                      TextSpan(text: "Coupon:".tr),
                      TextSpan(text: controller.checkout.coupon!.name),
                    ])),
                    Spacer(),
                    Text("${controller.checkout.coupon!.discount} %")
                  ]),
                SizedBox(height: 5),
                Row(children: [
                  Text('Discount'.tr),
                  Spacer(),
                  Text('${controller.totalItemsDiscount} %'),
                ]),
                SizedBox(height: 5),
                Row(children: [
                  Text('Shipping'.tr),
                  Spacer(),
                  Text("${controller.checkout.delevieryPrice} LE")
                ]),
                SizedBox(height: 5),
                Row(children: [
                  Text('PaymentMethod'.tr),
                  Spacer(),
                  Text("${controller.checkout.paymentMethod}")
                ]),
                SizedBox(height: 5),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 7),
                Row(children: [
                  Text('TotalPrice'.tr),
                  Spacer(),
                  Text("${controller.checkout.totalPrice!} LE",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                ]),
                Spacer(),
                ConfirmOrderBTN()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ConfirmOrderBTN extends StatelessWidget {
  const ConfirmOrderBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (controller) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: controller.statusRequest == StatusRequest.loading ? 60 : 300,
        height: controller.statusRequest == StatusRequest.loading ? 60 : 55,
        child: BTN(
            widget: controller.statusRequest == StatusRequest.loading
                ? Center(
                    child: CircularProgressIndicator(color: AppColors.white))
                : Text(
                    "ConfirmOrder".tr,
                    style: const TextStyle(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
            press: () {
              controller.ConfirmOrder(context);
              // controller.goToCheckoutPage();
            },
            padding: 20,
            color: AppColors.secondryColor),
      );
    });
  }
}
