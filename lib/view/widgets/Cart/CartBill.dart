import 'package:ecommerce/controller/Cart/cartController.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constants/AppAssets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/AppColors.dart';
import '../../../core/shared/BTN.dart';

class CartBill extends GetView<CartControllerImp> {
  const CartBill({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return DefaultTextStyle(
      style: TextStyle(color: Colors.grey[700], fontSize: 18),
      child: Container(
        height: 210,
        padding:
            EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20, bottom: 10),
        child: Column(
          children: [
            Row(children: [
              Text('Price'),
              Spacer(),
              Text("${controller.totalPrice}")
            ]),
            SizedBox(height: 5),
            Row(children: [
              Text('Discount'),
              Spacer(),
              Text("${controller.cartDiscount}")
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
              Text("${controller.totalPrice - controller.cartDiscount}",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold)),
            ]),
            Spacer(),
            GetBuilder<CartControllerImp>(builder: (controller) {
              return BTN(
                  widget: controller.statusRequest == StatusRequest.none
                      ? SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            color: AppColors.white,
                          ))
                      : Text(
                          "Check Out",
                          style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                  press: () {
                    // controller.
                  },
                  padding: 20,
                  color: AppColors.secondryColor,
                  width: double.infinity);
            })
          ],
        ),
      ),
    );
  }
}
