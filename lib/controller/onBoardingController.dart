import 'package:ecommerce/data/dataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/AppRoutes.dart';

abstract class onBoardingController extends GetxController {
  next() {}
  onPageChange(int index) {}
}

class onBoardingControllerImp extends onBoardingController {
  int currentPage = 0;
  late PageController pageController;
  int onBoardingAnimationTransition = 300;
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: onBoardingAnimationTransition),
          curve: Curves.easeIn);
      return super.next();
    }
  }

  @override
  onPageChange(int index) {
    currentPage = index;
    update();
    return super.onPageChange(index);
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
