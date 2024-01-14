import 'package:race_shop/controller/orderDetails/orderDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:race_shop/core/constants/AppColors.dart';
import 'package:race_shop/core/functions/ThemeColorFix.dart';

class OrderDetailsAddress extends GetView<orderDetailsController> {
  const OrderDetailsAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(orderDetailsController());

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 3),
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 20)
              .copyWith(top: 10, bottom: 10),
          child: DefaultTextStyle(
            style: TextStyle(fontSize: 15, color: ThemeColorFix()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("DeliveryDetails".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                SizedBox(height: 10),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Street:'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${controller.order.address!.street}'),
                ])),
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
                                '${controller.order.address!.buildingNumber}'),
                      ])),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Floor:'.tr,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '${controller.order.address!.floorNumber}'),
                      ])),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Apartment:'.tr,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                '${controller.order.address!.apartmentNumber}'),
                      ])),
                    ]),
                SizedBox(height: 5),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Zone:'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${controller.order.address!.city}'),
                ])),
                SizedBox(height: 5),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'DeliveyTime:'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "within".tr),
                  TextSpan(text: '${controller.order.delevieryTimeInDays}'),
                  TextSpan(text: "Days".tr),
                ])),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
