import 'package:ecommerce/controller/onBoardingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/dataSource/static/static.dart';

class onBoardingSlider extends GetView<onBoardingControllerImp> {
  const onBoardingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImp());
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) => controller.onPageChange(value),
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(onBoardingList[index].image),
                  const SizedBox(height: 40),
                  Text(
                    onBoardingList[index].title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    onBoardingList[index].body,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ));
  }
}
