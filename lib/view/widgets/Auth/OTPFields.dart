import 'package:ecommerce/controller/auth/checkEmail.dart';
import 'package:ecommerce/controller/auth/forgetPassword.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OTPFields extends StatelessWidget {
  const OTPFields({
    super.key,
    required this.mycontroller,
  });
  final GetxController mycontroller;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(mycontroller);
    return OtpTextField(
      numberOfFields: 5,
      borderColor: AppColors.primaryColor,
      showFieldAsBox: true,
      borderRadius: BorderRadius.circular(10),
      fieldWidth: 45,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      onCodeChanged: (String code) {},
      onSubmit: (String verificationCode) {
        checkEmailControllerImp.virificationCode = verificationCode;
        if (controller is checkEmailControllerImp) {
          controller.checkSignupEmail();
        } else if (controller is forgetPasswordImp) {
          Get.toNamed(AppRoutes.restPassword);
        }
      }, // end onSubmit
    );
  }
}
