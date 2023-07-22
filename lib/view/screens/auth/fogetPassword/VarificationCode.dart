import 'package:ecommerce/controller/auth/forgetPassword.dart';
import 'package:ecommerce/core/shared/customAppBar.dart';
import 'package:ecommerce/view/widgets/Auth/otpTimer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/Auth/OTPFields.dart';

class varificationCode extends StatelessWidget {
  const varificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(forgetPasswordImp());
    return Scaffold(
      appBar: customAppBar(context, "varificationTitle"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
        child: GetBuilder<forgetPasswordImp>(builder: (controller) {
          return Column(
            children: [
              Text(
                'varificationDesc'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 17),
              ),
              const SizedBox(height: 40),
              OTPFields(mycontroller: forgetPasswordImp()),
              const SizedBox(height: 60),
              optTimer(
                  controller: controller.otpTimerButtonController,
                  otpTimer: controller.otpTimer,
                  press: () {
                    controller.resendOTP(context);
                    controller.otpTimerButtonController.startTimer();
                  }),
            ],
          );
        }),
      ),
    );
  }
}
