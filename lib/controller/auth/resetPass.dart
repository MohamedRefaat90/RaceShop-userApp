import 'package:race_shop/controller/auth/checkEmail.dart';
import 'package:race_shop/controller/auth/signup.dart';
import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/functions/toast.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/dataSource/remote/Auth/resetPasswordData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/AppRoutes.dart';

abstract class resetPasswordController extends GetxController {
  resetPassword();
  passVisible();
  confirmPassVisible();
}

class resetPasswordImp extends resetPasswordController {
  late TextEditingController newPass;
  late TextEditingController reNewPass;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool passVisibility = true;
  bool confirmPassVisibility = true;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  @override
  resetPassword() async {
    var fromdata = formkey.currentState;

    if (fromdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.resetPassword(
          email: myServices.sharedPreferences.getString("useremail")!,
          password: newPass.text,
          passwordConfirm: reNewPass.text,
          otp: checkEmailControllerImp.virificationCode);
      // print("Reset Password userEmail ==> ${useremail.trim()}");
      // print("virificationCode ==> ${checkEmailControllerImp.virificationCode}");
      statusRequest = handelData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoutes.successResetPass);
        } else {
          Get.offNamedUntil(AppRoutes.login, (route) => false);
          toastAlert(msg: response['message'], color: Colors.red);
        }
      }
    }
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

  @override
  void onInit() {
    newPass = TextEditingController();
    reNewPass = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    newPass.dispose();
    reNewPass.dispose();
    super.dispose();
  }
}
