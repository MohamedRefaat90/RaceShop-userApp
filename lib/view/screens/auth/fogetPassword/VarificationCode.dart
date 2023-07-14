import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/core/shared/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/varificationCode.dart';
import '../../../../core/shared/BTN.dart';
import '../../../widgets/Auth/OTPFields.dart';

class varificationCode extends GetView<varificationControllerImp> {
  const varificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(varificationControllerImp());
    return Scaffold(
      appBar: customAppBar(context, "varificationTitle"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'forgetPassDesc'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 17),
              ),
              const SizedBox(height: 40),
              const OTPFields(goTo: AppRoutes.restPassword),
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
