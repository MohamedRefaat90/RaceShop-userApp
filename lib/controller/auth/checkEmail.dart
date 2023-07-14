import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class checkEmailController extends GetxController {
  checkSignupEmail();
  goToSuccessSignup();
}

class checkEmailControllerImp extends checkEmailController {
  late TextEditingController virificationCode;

  @override
  goToSuccessSignup() {
    Get.toNamed(AppRoutes.successSignup);
  }

  @override
  void onInit() {
    virificationCode = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    virificationCode.dispose();
    super.dispose();
  }

  @override
  checkSignupEmail() {
    Get.offNamed(AppRoutes.successSignup);
  }
}
