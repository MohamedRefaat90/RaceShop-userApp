// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/controller/auth/signup.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handelDataController.dart';
import 'package:ecommerce/core/functions/toast.dart';
import 'package:ecommerce/data/dataSource/remote/Auth/resendOTPData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce/data/dataSource/remote/Auth/checkEmailData.dart';
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

  @override
  checkSignupEmail() async {
    var response =
        await checkEmaildata.checkEmail(useremail.trim(), virificationCode);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      print(response['status']);
      if (response['status'] == null) {
        Get.offNamed(AppRoutes.successSignup);
        print(response['status']);
      } else if (response['status'] == 'fail') {
        print(response['status']);
        toastAlert(msg: response['message'], color: Colors.red);
      }
    }
  }

  @override
  resendOTP() async {
    // resetOTP_Btn();
    // print(otpTimer);
    var response = await resendOTPData.resendOTP(useremail.trim());

    statusRequest = handelData(response);
    print(useremail);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        toastAlert(msg: response['message'], color: Colors.green);
        print(useremail);
      } else {
        toastAlert(msg: response['message'], color: Colors.red);
        print(useremail);
      }
    }
  }

  @override
  void onInit() {
    otpTimerButtonController = OtpTimerButtonController();
    super.onInit();
  }
}
