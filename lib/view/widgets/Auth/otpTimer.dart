import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../../../core/constants/AppColors.dart';

class optTimer extends StatelessWidget {
  const optTimer(
      {super.key,
      required this.controller,
      required this.otpTimer,
      this.press});

  final OtpTimerButtonController controller;
  final int otpTimer;
  final Function()? press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: OtpTimerButton(
          controller: controller,
          height: 60,
          text: Text('resendOTP'.tr),
          duration: otpTimer,
          radius: 30,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
          buttonType:
              ButtonType.elevated_button, // or ButtonType.outlined_button
          loadingIndicator: const CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.red,
          ),
          loadingIndicatorColor: Colors.red,
          onPressed: press),
    );
  }
}
