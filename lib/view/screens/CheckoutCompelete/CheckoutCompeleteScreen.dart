import 'package:race_shop/controller/Cart/cartController.dart';
import 'package:race_shop/controller/checkoutCompelete/checkoutCompeleteController.dart';
import 'package:race_shop/core/class/responsive.dart';
import 'package:race_shop/core/constants/AppColors.dart';
import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/core/shared/BTN.dart';
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
                    Text("CongratulationYourOrderisCompelete".tr,
                        style: TextStyle(
                            fontSize: Responsive.getSize(context).width * 0.039,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black)),
                    SizedBox(height: 20),
                    BTN(
                        widget: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.home, size: 30),
                            SizedBox(width: 5),
                            Text("Home".tr, style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        padding: 10,
                        width: 170,
                        press: () {
                          // cartControllerImp.cartProducts.clear();
                          Get.offAllNamed(AppRoutes.home);
                        })
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text("CongratulationYourOrderisCompelete".tr,
                          style: TextStyle(
                              fontSize:
                                  Responsive.getSize(context).width * 0.039,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black)),
                      Lottie.asset(AppAssets.orderCompelete2, height: 200),
                      Text.rich(TextSpan(
                          children: [
                            TextSpan(text: "BillID:".tr),
                            TextSpan(text: "${controller.BillID.toString()}"),
                          ],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black))),
                      SizedBox(height: 10),
                      Text(
                          "UseThisBillIDToNearestFawryMachineForCompeleteYourPurchase"
                              .tr,
                          style:
                              TextStyle(fontSize: 18, color: AppColors.black)),
                      SizedBox(height: 20),
                      BTN(
                          widget: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.home, size: 30),
                              SizedBox(width: 5),
                              Text("Home".tr, style: TextStyle(fontSize: 18)),
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
