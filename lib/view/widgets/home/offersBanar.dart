import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/LanguageController/LanguageController.dart';
import '../../../controller/home/HomeController.dart';
import '../../../core/class/responsive.dart';
import '../../../core/constants/AppColors.dart';

class offersBanar extends GetView<LanguageController> {
  const offersBanar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsetsDirectional.only(start: 15),
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Stack(children: [
        GetBuilder<LanguageController>(builder: (controller) {
          return Positioned(
            right: controller.sharedLang == "en" ? -50 : 180,
            // left: controller.lang == "ar" ? -50 : null,
            top: -20,
            child: Container(
              width: Responsive.getSize(context).width * 0.70,
              height: Responsive.getSize(context).width * 0.70,
              decoration: const BoxDecoration(
                  color: AppColors.secondryColor,
                  borderRadius: BorderRadius.all(Radius.circular(5000))),
            ),
          );
        }),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'offerTitle'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 25, color: AppColors.white),
            ),
            Text('offerDesc'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20, color: AppColors.white)),
          ],
        ),
      ]),
    );
  }
}
