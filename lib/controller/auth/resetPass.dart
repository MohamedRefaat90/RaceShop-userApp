import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/AppRoutes.dart';

abstract class resetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPass();
}

class resetPasswordImp extends resetPasswordController {
  late TextEditingController newPass;
  late TextEditingController reNewPass;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  resetPassword() {
    var fromdata = formkey.currentState;

    if (fromdata!.validate()) {
      print("V a l i d");
    } else {
      print("N O T V a l i d");
    }
  }

  @override
  goToSuccessResetPass() {
    Get.toNamed(AppRoutes.successResetPass);
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
