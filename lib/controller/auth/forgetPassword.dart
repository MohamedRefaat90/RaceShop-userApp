import 'package:race_shop/controller/auth/signup.dart';
import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/functions/toast.dart';
import 'package:race_shop/data/dataSource/remote/Auth/forgetPasswrodData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../../core/services/myServices.dart';
import '../../data/dataSource/remote/Auth/resendOTPData.dart';

abstract class forgetPassword extends GetxController {
  goToVarificationCode();
  resendOTP(BuildContext context);
}

class forgetPasswordImp extends forgetPassword {
  late TextEditingController email;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  ResendOTPData resendOTPData = ResendOTPData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late OtpTimerButtonController otpTimerButtonController;
  MyServices myServices = Get.find();
  int otpTimer = 90;
  @override
  goToVarificationCode() async {
    var fromdata = formkey.currentState;
    if (fromdata!.validate()) {
      statusRequest = StatusRequest.loading;
      myServices.sharedPreferences.setString("useremail", email.text.trim());

      update();
      var response = await forgetPasswordData.forgetPasswordData(
          myServices.sharedPreferences.getString("useremail")!);

      statusRequest = handelData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoutes.varificationCode);

          toastAlert(msg: response['message'], color: Colors.green);
        }
      } else {
        update();
        toastAlert(msg: response['message'], color: Colors.red);
      }
    }
  }

  @override
  resendOTP(BuildContext context) async {
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
    email = TextEditingController();
    otpTimerButtonController = OtpTimerButtonController();
    super.onInit();
  }
}
