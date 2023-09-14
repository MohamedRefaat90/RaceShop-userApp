import 'package:ecommerce/controller/onBoarding/onBoardingController.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/shared/BTN.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/onBoarding/DottsController.dart';
import '../../widgets/onBoarding/onBoardingSlider.dart';

class OnBoardingScreen extends GetView<onBoardingControllerImp> {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: onBoardingSlider(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const DottsController(),
                const SizedBox(height: 50),
                BTN(
                  widget: Text(
                    "continue".tr,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  press: () => controller.next(),
                  color: AppColors.primaryColor,
                  width: 250,
                ),
                TextButton(
                    onPressed: () => controller.skip(),
                    child: Text(
                      'skip'.tr,
                      style: const TextStyle(color: AppColors.primaryColor),
                    )),
              ],
            ),
          )
        ],
      )),
    );
  }
}
