import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/controller/LanguageController/LanguageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/BTN.dart';

class Languages extends GetView<LanguageController> {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('chooseLang'.tr,
              style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 20),
          BTN(
              widget: Text(
                "Ar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              width: 120,
              press: () {
                controller.changeLanguage('ar');
                Get.toNamed(AppRoutes.onBoarding);
              }),
          const SizedBox(height: 20),
          BTN(
              widget: Text("En", style: TextStyle(fontWeight: FontWeight.bold)),
              width: 120,
              press: () {
                controller.changeLanguage('en');
                Get.toNamed(AppRoutes.onBoarding);
              }),
        ],
      ),
    ));
  }
}
