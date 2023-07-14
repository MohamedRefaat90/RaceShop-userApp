import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/core/functions/checkInternetConncetion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  passVisible();
  goToSignup();
  goToForgetPassword();
  tetsinginterner();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool visibility = true;
  var testConnection;

  @override
  login() {
    var fromdata = formkey.currentState;

    if (fromdata!.validate()) {
      print("V a l i d");
    } else {
      print("N O T V a l i d");
    }
  }

  @override
  passVisible() {
    visibility = !visibility;
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
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    tetsinginterner();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  tetsinginterner() async {
    testConnection = await checkInternetConnection();
    print(testConnection);
  }
}
