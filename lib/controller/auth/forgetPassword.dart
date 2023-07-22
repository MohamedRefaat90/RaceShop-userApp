import 'package:ecommerce/controller/auth/signup.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/core/functions/handelDataController.dart';
import 'package:ecommerce/core/functions/toast.dart';
import 'package:ecommerce/data/dataSource/remote/Auth/forgetPasswrodData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

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
  int otpTimer = 90;
  @override
  goToVarificationCode() async {
    var fromdata = formkey.currentState;
    if (fromdata!.validate()) {
      statusRequest = StatusRequest.loading;
      useremail = email.text.trim();
      update();
      var response = await forgetPasswordData.forgetPasswordData(useremail);

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
    // resetOTP_Btn();
    // print(otpTimer);
    var response = await resendOTPData.resendOTP(useremail);

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
    email = TextEditingController();
    otpTimerButtonController = OtpTimerButtonController();
    super.onInit();
  }
}
