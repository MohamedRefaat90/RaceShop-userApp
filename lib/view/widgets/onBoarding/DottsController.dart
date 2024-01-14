import 'package:race_shop/controller/onBoarding/onBoardingController.dart';
import 'package:race_shop/core/constants/AppColors.dart';
import 'package:race_shop/data/dataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DottsController extends StatelessWidget {
  const DottsController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(builder: (controller) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    duration: Duration(
                        milliseconds: controller.onBoardingAnimationTransition),
                    width: controller.currentPage == index ? 15 : 9,
                    height: 9,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  )));
    });
  }
}
