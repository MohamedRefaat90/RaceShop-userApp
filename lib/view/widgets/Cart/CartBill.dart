import 'package:ecommerce/controller/Cart/cartController.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/shared/customField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/AppColors.dart';
import '../../../core/shared/BTN.dart';

class CartBill extends GetView<CartControllerImp> {
  const CartBill({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());

    return DefaultTextStyle(
      style: TextStyle(color: Colors.grey[700], fontSize: 18),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          GetBuilder<CartControllerImp>(builder: (controller) {
            return Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Center(
                  child: Opacity(
                    opacity: controller.opacity2,
                    child: TextButton(
                        onPressed: () {
                          print('Yes i have a Copun');
                          controller.haveCoupon();
                        },
                        child: Text("You Have a Copun")),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: controller.opacity1,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    transform:
                        Matrix4.translationValues(0, controller.transform, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            flex: 2,
                            child: customField(
                                lable: "Copun Name",
                                hint: "",
                                textEditingController: controller.couponName)),
                        SizedBox(width: 10),
                        Expanded(
                            child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            child: BTN(
                                widget: Text(controller.coupon == null
                                    ? "Apply"
                                    : "Cancel"),
                                width: controller.statusRequest ==
                                        StatusRequest.none
                                    ? 70
                                    : 100,
                                color: controller.coupon == null
                                    ? AppColors.primaryColor
                                    : AppColors.secondryColor,
                                press: () {
                                  if (controller.coupon == null) {
                                    if (controller
                                        .couponName!.text.isNotEmpty) {
                                      controller.varifyCoupon(
                                          context, controller.couponName!.text);
                                    }
                                  } else {
                                    controller.cancelCoupon();
                                  }
                                }),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
          SizedBox(height: 10),
          Container(
            height: 230,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 3),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 20)
                .copyWith(top: 20, bottom: 10),
            child: Column(
              children: [
                Row(children: [
                  Text('Price'),
                  Spacer(),
                  Text("${controller.totalPrice} LE")
                ]),
                SizedBox(height: 5),
                Row(children: [
                  Text('Discount'),
                  Spacer(),
                  controller.coupon == null
                      ? Text("${controller.cartDiscount} %")
                      : Text(
                          "${controller.cartDiscount + controller.couponDiscount} %")
                ]),
                SizedBox(height: 5),
                Row(children: [
                  Text('You Saved'),
                  Spacer(),
                  controller.coupon == null
                      ? Text(
                          "${(controller.totalPrice * controller.cartDiscount) ~/ 100} LE")
                      : Text(
                          "${(controller.totalPrice * (controller.cartDiscount + controller.couponDiscount)) ~/ 100} LE")
                ]),
                SizedBox(height: 10),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 7),
                Row(children: [
                  Text(
                    'Total Price',
                    style: TextStyle(color: AppColors.black),
                  ),
                  Spacer(),
                  Text(
                      "${controller.totalPrice - (controller.totalPrice * (controller.cartDiscount + controller.couponDiscount)) ~/ 100} LE",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold)),
                ]),
                Spacer(),
                checkoutBTN()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class checkoutBTN extends StatelessWidget {
  const checkoutBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: controller.statusRequest == StatusRequest.none ? 60 : 300,
        height: controller.statusRequest == StatusRequest.none ? 60 : 55,
        child: BTN(
          widget: controller.statusRequest == StatusRequest.none
              ? Center(child: CircularProgressIndicator(color: AppColors.white))
              : Text(
                  "Check Out",
                  style: const TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                ),
          press: () {
            controller.goToCheckoutPage();
          },
          padding: 20,
          color: AppColors.secondryColor,
        ),
      );
    });
  }
}
