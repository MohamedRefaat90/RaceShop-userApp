import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/core/functions/toast.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/Model/userModel.dart';
import 'package:race_shop/data/dataSource/remote/Auth/loginData.dart';
import 'package:race_shop/data/dataSource/remote/User/userData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handelDataController.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  bool visibility = true;
  var testConnection;
  MyServices myServices = Get.find();
  userModel? user;
  LoginData loginData = LoginData(Get.find());
  UserData userData = UserData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  bool isLogin = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  login() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await loginData.loginData(
        email: email.text.trim(), password: password.text);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        myServices.sharedPreferences.setString("userToken", response['token']);
        myServices.sharedPreferences.setBool("isLogin", true);
        getUserData();
        Get.toNamed(AppRoutes.home, arguments: user);
      }
    } else {
      // Get.offAllNamed(AppRoutes.login);
      toastAlert(msg: "userorpaswwordnotCorrecttryagain".tr, color: Colors.red);
    }

    update();
  }

  getUserData() async {
    var response = await userData
        .getUserData(myServices.sharedPreferences.getString("userToken")!);
    statusRequest = handelData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        user = userModel.fromJson(response['data']['data']);

        myServices.sharedPreferences.setString("fName", user!.firstName!);
        myServices.sharedPreferences.setString("lName", user!.lastName!);
        myServices.sharedPreferences.setString("Uid", user!.Id!);

        // Get.toNamed(AppRoutes.home);
      }
    }
  }

  goToSignup() {
    Get.toNamed(AppRoutes.signup);
  }

  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

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

  passVisible() {
    visibility = !visibility;
    update();
  }

  logout() {
    loginData.logout(myServices.sharedPreferences.getString('userToken')!);
    myServices.sharedPreferences.setBool("isLogin", false);

    Get.offAllNamed(AppRoutes.login);
  }
}
