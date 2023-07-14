import 'package:ecommerce/core/shared/BTN.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/resetPass.dart';
import '../../../../core/functions/validateInputs.dart';
import '../../../../core/shared/customAppBar.dart';
import '../../../../core/shared/customField.dart';

class resetPassword extends GetView<resetPasswordImp> {
  const resetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(resetPasswordImp());
    return Scaffold(
      appBar: customAppBar(context, "resetPassTitle"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
        child: Form(
          key: controller.formkey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              customField(
                  validator: (value) {
                    return ValidateInputs(value!, "password", 8, 30);
                  },
                  lable: 'newPass'.tr,
                  icon: Icons.visibility,
                  hint: "newPass".tr),
              const SizedBox(height: 20),
              BTN(
                lable: 'reset'.tr,
                press: () {
                  controller.goToSuccessResetPass();
                },
                width: 350,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
