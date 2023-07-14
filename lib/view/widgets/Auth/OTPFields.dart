import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OTPFields extends StatelessWidget {
  const OTPFields({
    super.key,
    required this.goTo,
  });
  final String goTo;
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 5,
      borderColor: AppColors.primaryColor,
      showFieldAsBox: true,
      borderRadius: BorderRadius.circular(10),
      fieldWidth: 45,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      onCodeChanged: (String code) {},
      onSubmit: (String verificationCode) {
        Get.offAllNamed(goTo);
      }, // end onSubmit
    );
  }
}
