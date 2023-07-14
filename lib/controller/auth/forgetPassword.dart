import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class forgetPassword extends GetxController {
  goToVarificationCode();
}

class forgetPasswordImp extends forgetPassword {
  late TextEditingController email;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  goToVarificationCode() {
    var fromdata = formkey.currentState;

    if (fromdata!.validate()) {
      Get.toNamed(AppRoutes.varificationCode);
      print("V a l i d");
    } else {
      print("N O T V a l i d");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
