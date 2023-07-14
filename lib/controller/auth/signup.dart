import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/AppRoutes.dart';

abstract class SignupController extends GetxController {
  signup();
  goToLogin();
  passVisible();
  confirmPassVisible();
}

class SignupControllerImp extends SignupController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool passVisibility = true;
  bool confirmPassVisibility = true;
  @override
  signup() {
    var fromdata = formkey.currentState;

    if (fromdata!.validate()) {
      Get.toNamed(AppRoutes.checkEmail);
      print("V a l i d");
    } else {
      print("N O T V a l i d");
    }
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  passVisible() {
    passVisibility = !passVisibility;
    update();
  }

  @override
  confirmPassVisible() {
    confirmPassVisibility = !confirmPassVisibility;
    update();
  }
}
