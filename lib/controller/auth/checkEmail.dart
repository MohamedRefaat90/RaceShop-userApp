// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:race_shop/controller/auth/signup.dart';
import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/functions/toast.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/dataSource/remote/Auth/resendOTPData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:race_shop/data/dataSource/remote/Auth/checkEmailData.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../../core/constants/AppRoutes.dart';

abstract class checkEmailController extends GetxController {
  checkSignupEmail();
  resendOTP();
}

class checkEmailControllerImp extends checkEmailController {
  static late String virificationCode;
  StatusRequest statusRequest = StatusRequest.none;

  checkEmailData checkEmaildata = checkEmailData(Get.find());
  ResendOTPData resendOTPData = ResendOTPData(Get.find());
  late OtpTimerButtonController otpTimerButtonController;
  int otpTimer = 90;
  MyServices myServices = Get.find();

  @override
  checkSignupEmail() async {
    var response = await checkEmaildata.checkEmail(
        myServices.sharedPreferences.getString("useremail")!, virificationCode);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == null) {
        Get.offNamed(AppRoutes.successSignup);
      } else if (response['status'] == 'fail') {
        toastAlert(msg: response['message'], color: Colors.red);
      }
    }
  }

  @override
  resendOTP() async {
    var response = await resendOTPData
        .resendOTP(myServices.sharedPreferences.getString("useremail")!);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        toastAlert(msg: response['message'], color: Colors.green);
      } else {
        toastAlert(msg: response['message'], color: Colors.red);
      }
    }
  }

  @override
  void onInit() {
    otpTimerButtonController = OtpTimerButtonController();
    super.onInit();
  }
}
