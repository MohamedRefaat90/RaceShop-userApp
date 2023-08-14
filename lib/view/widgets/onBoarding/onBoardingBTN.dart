import 'package:ecommerce/controller/onBoarding/onBoardingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/AppColors.dart';

class onBoardingBTN extends GetView<onBoardingControllerImp> {
  const onBoardingBTN({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => controller.next(),
      color: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textColor: Colors.white,
      child: Text("continue".tr),
    );
  }
}
