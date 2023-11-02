import 'package:ecommerce/controller/checkoutCompelete/checkoutCompeleteController.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/core/shared/BTN.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/AppAssets.dart';

class checkoutCompeleteScreen extends GetView<CheckoutCompeleteController> {
  const checkoutCompeleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutCompeleteController());
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(0.8),
      body: Center(
        child: Container(
          width: 340,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: AppColors.white),
          child: controller.BillID == null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppAssets.orderCompelete2, height: 200),
                    Text("Congratulation Your Order is Compelete",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    BTN(
                        widget: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.home, size: 30),
                            SizedBox(width: 5),
                            Text("Home", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        padding: 10,
                        width: 170,
                        press: () {
                          Get.offAllNamed(AppRoutes.home);
                        })
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text("Congratulation Your Order is Compelete",
                          style: TextStyle(fontSize: 16)),
                      Lottie.asset(AppAssets.orderCompelete2, height: 200),
                      Text("Bill ID :  ${controller.BillID.toString()}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(
                        "Use This Bill ID To Nearest Fawry Machine For Compelete Your Purchase",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      BTN(
                          widget: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.home, size: 30),
                              SizedBox(width: 5),
                              Text("Home", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          padding: 10,
                          width: 170,
                          press: () {
                            Get.offAllNamed(AppRoutes.home);
                          })
                    ]),
        ),
      ),
    );
  }
}
