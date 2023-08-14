import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/core/functions/toast.dart';
import 'package:ecommerce/core/services/myServices.dart';
import 'package:ecommerce/data/dataSource/remote/Auth/loginData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handelDataController.dart';

abstract class LoginController extends GetxController {
  login();
  passVisible();
  goToSignup();
  goToForgetPassword();
  logout();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool visibility = true;
  var testConnection;
  MyServices myServices = Get.find();

  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  login() async {
    var fromdata = formkey.currentState;

    if (fromdata!.validate()) {
      {
        statusRequest = StatusRequest.loading;
        update();
        var response = await loginData.loginData(
            email: email.text.trim(), password: password.text);

        statusRequest = handelData(response);

        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            myServices.sharedPreferences
                .setString("userToken", response['token']);

            Get.offAllNamed(AppRoutes.home);
          } else {
            update();
            toastAlert(msg: response['message'], color: Colors.red);
          }
        }
      }
    }
    update();
  }

  @override
  goToSignup() {
    Get.toNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() async {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  passVisible() {
    visibility = !visibility;
    update();
  }

  logout() {
    loginData.logout(myServices.sharedPreferences.getString('userToken')!);

    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
