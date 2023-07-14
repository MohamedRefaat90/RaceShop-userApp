import 'package:ecommerce/controller/auth/checkEmail.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/view/widgets/Auth/OTPFields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/BTN.dart';
import '../../../../core/shared/customAppBar.dart';

class CheckEmail extends GetView<checkEmailControllerImp> {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(checkEmailControllerImp());
    return Scaffold(
      appBar: customAppBar(context, "checkEmailTitle".tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'checkEmailDesc'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 14),
              ),
              const SizedBox(height: 40),
              const OTPFields(goTo: AppRoutes.successSignup),
              const SizedBox(height: 60),
              BTN(lable: 'resendOTP'.tr, press: () {}, width: 350),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
