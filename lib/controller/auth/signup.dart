import 'package:ecommerce/data/dataSource/remote/Auth/signupData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/constants/AppRoutes.dart';
import '../../core/functions/flushBar.dart';
import '../../core/functions/handelDataController.dart';

abstract class SignupController extends GetxController {
  signup(BuildContext context);
  // resendOTP();
  goToLogin();
  passVisible();
  confirmPassVisible();
}

late String useremail;

class SignupControllerImp extends SignupController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool passVisibility = true;
  bool confirmPassVisibility = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  late String message;

  @override
  signup(BuildContext context) async {
    var fromdata = formkey.currentState;

    if (fromdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postSignupData(username.text,
          email.text.trim(), password.text, confirmPassword.text, phone.text);

      statusRequest = handelData(response);

      // Means response == Map not statusRequset
      if (statusRequest == StatusRequest.success) {
        useremail = email.text;

        if (response['status'] == "success") {
          Get.toNamed(AppRoutes.checkEmail, arguments: [
            {"email": email.text.trim()}
          ]);
          update();
          flushBar(context,
              message: response['message'], status: statusRequest);
        } else {
          statusRequest = StatusRequest.failure;
          update();
          flushBar(context,
              message: response['message'], status: statusRequest);
        }
      } else {
        update();
        flushBar(context, status: statusRequest);
      }
    }
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
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
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
