import 'package:ecommerce/controller/auth/checkEmail.dart';
import 'package:ecommerce/view/widgets/Auth/OTPFields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared/customAppBar.dart';
import '../../../widgets/Auth/otpTimer.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(checkEmailControllerImp());
    return Scaffold(
      appBar: customAppBar(context, "checkEmailTitle".tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
        child: GetBuilder<checkEmailControllerImp>(builder: (controller) {
          return Column(
            children: [
              Text(
                'checkEmailDesc'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 14),
              ),
              const SizedBox(height: 40),
              OTPFields(mycontroller: checkEmailControllerImp()),
              const SizedBox(height: 60),
              optTimer(
                  controller: controller.otpTimerButtonController,
                  otpTimer: controller.otpTimer,
                  press: () {
                    controller.resendOTP();
                    controller.otpTimerButtonController.startTimer();
                  }),
            ],
          );
        }),
      ),
    );
  }
}
