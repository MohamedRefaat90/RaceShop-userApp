import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:race_shop/core/class/statusRequest.dart';

import '../../../controller/orders/ordersController.dart';
import '../../../core/constants/AppColors.dart';
import '../../../core/constants/AppRoutes.dart';
import '../../../core/shared/BTN.dart';
import '../../../data/Model/OrderModel.dart';
import 'orderStatusStepper.dart';

class orderCard extends GetView<ordersController> {
  const orderCard({super.key, required this.order, required this.index});
  final OrderModel order;
  final int index;
  @override
  Widget build(BuildContext context) {
    controller.changeStepper(order.status!);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: GetBuilder<ordersController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "OrderNumber:".tr),
                    TextSpan(text: "${index + 1}")
                  ], style: TextStyle(fontSize: 20))),
                  Text("${Jiffy.parse(order.createdAt!).fromNow()}"),
                ],
              ),
              SizedBox(height: 10),
              Text.rich(TextSpan(children: [
                TextSpan(text: "PaymentType:".tr),
                TextSpan(text: "${order.paymentMethod}")
              ])),
              SizedBox(height: 5),
              Text.rich(TextSpan(children: [
                TextSpan(text: "OrderPrice:".tr),
                TextSpan(text: "${order.totalItemsPrice} LE")
              ])),
              SizedBox(height: 5),
              Text.rich(TextSpan(children: [
                TextSpan(text: "ShippingPrice:".tr),
                TextSpan(text: "${order.delevieryPrice} LE")
              ])),
              SizedBox(height: 5),
              if (order.coupon != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(text: "Coupon:".tr),
                      TextSpan(text: "${order.coupon['name']} LE")
                    ])),
                    SizedBox(height: 5),
                    if (order.coupon != null)
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "CouponDiscount:".tr),
                        TextSpan(text: "${order.coupon['discount']} %")
                      ])),
                    SizedBox(height: 5),
                  ],
                ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "ShippingTime:Within".tr),
                TextSpan(text: "${order.delevieryTimeInDays}"),
                TextSpan(text: "Days".tr),
              ])),
              SizedBox(height: 5),
              Text.rich(TextSpan(children: [
                TextSpan(text: "OrderStatus:".tr),
                TextSpan(
                    text:
                        "${order.status == "canceled" || order.status == "canceledBeforePending" ? "Canceled".tr : '${order.status}'.tr}"),
              ])),
              if (order.status != "canceled" &&
                  order.status != "canceledBeforePending")
                orderStatusStepper(),
              SizedBox(height: 5),
              Divider(
                  thickness: 3,
                  indent: 50,
                  endIndent: 50,
                  color: AppColors.primaryColor),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(TextSpan(
                      children: [
                        TextSpan(text: "TotalPrice:".tr),
                        TextSpan(text: "${order.totalPrice} LE"),
                      ],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15))),
                  Spacer(),
                  if (order.status == "pending")
                    BTN(
                        widget: controller.statusRequest == StatusRequest.none
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    strokeWidth: 4, color: AppColors.white),
                              )
                            : Text("Cancel".tr),
                        color: AppColors.secondryColor,
                        press: () {
                          if (order.sId == controller.orders[index]['_id']) {
                            controller.cancelOrder(order.sId!);
                          }
                        },
                        padding: 12),
                  if (order.status != "pending" &&
                      order.status != "preCheckout")
                    BTN(
                        widget: Text("OrderDetails".tr),
                        press: () {
                          Get.toNamed(AppRoutes.ordersDetails,
                              arguments: {"order": order});
                        },
                        padding: 12)
                ],
              ),
              SizedBox(height: 10),
              if (order.status == "pending" || order.status == "preCheckout")
                BTN(
                    widget: Text("OrderDetails".tr),
                    width: double.infinity,
                    press: () {
                      Get.toNamed(AppRoutes.ordersDetails,
                          arguments: {"order": order});
                    },
                    padding: 12)
            ],
          ),
        );
      }),
    );
  }
}
