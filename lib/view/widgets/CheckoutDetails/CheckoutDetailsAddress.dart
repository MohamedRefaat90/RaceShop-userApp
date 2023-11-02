import 'package:ecommerce/controller/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutDetailsAddress extends GetView<CheckoutController> {
  const CheckoutDetailsAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());

    return DefaultTextStyle(
      style: TextStyle(color: Colors.grey[700], fontSize: 18),
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
                  child: Text("Delivery Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                SizedBox(height: 10),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Street : ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${controller.checkout.address!.street}'),
                ])),
                SizedBox(height: 5),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Building :  ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                '${controller.checkout.address!.buildingNumber}'),
                      ])),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Floor : ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                '${controller.checkout.address!.floorNumber}'),
                      ])),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Apartment :',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                '${controller.checkout.address!.apartmentNumber}'),
                      ])),
                    ]),
                SizedBox(height: 5),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Zone : ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${controller.checkout.address!.city}'),
                ])),
                SizedBox(height: 5),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Delivey Time : ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'with in ${controller.checkout.delevieryTimeInDays} days'),
                ])),
                SizedBox(height: 5),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
