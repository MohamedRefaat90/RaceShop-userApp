import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/onBoarding/DottsController.dart';
import '../widgets/onBoarding/onBoardingBTN.dart';
import '../widgets/onBoarding/onBoardingSlider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const Spacer(),
                const onBoardingBTN(),
                TextButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.login);
                    },
                    child: Text(
                      'skip'.tr,
                      style: const TextStyle(color: AppColors.primaryColor),
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
