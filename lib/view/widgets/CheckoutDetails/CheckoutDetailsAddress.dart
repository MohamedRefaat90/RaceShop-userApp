import 'package:race_shop/controller/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:race_shop/core/functions/ThemeColorFix.dart';

class CheckoutDetailsAddress extends GetView<CheckoutController> {
  const CheckoutDetailsAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());

    return DefaultTextStyle(
      style: TextStyle(fontSize: 15, color: ThemeColorFix()),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 20)
                .copyWith(top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("DeliveryDetails".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                SizedBox(height: 10),
                Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'Street:'.tr,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '${controller.checkout.address!.street}'),
                    ]),
                    softWrap: true),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Building:'.tr,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                '${controller.checkout.address!.buildingNumber}'),
                      ])),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Floor:'.tr,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                '${controller.checkout.address!.floorNumber}'),
                      ])),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Apartment:'.tr,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                '${controller.checkout.address!.apartmentNumber}'),
                      ])),
                    ]),
                SizedBox(height: 5),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Zone:'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${controller.checkout.address!.city}'),
                ])),
                SizedBox(height: 5),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'DeliveyTime:'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "within".tr),
                  TextSpan(
                      text: ' ${controller.checkout.delevieryTimeInDays} '),
                  TextSpan(text: "Days".tr),
                ])),
                SizedBox(height: 5)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
