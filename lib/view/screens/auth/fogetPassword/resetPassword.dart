import 'package:ecommerce/core/shared/BTN.dart';
import 'package:ecommerce/view/widgets/Auth/HandleingRequsetData.dart';
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
    resetPasswordImp controller = Get.put(resetPasswordImp());
    return Scaffold(
      appBar: customAppBar(context, "resetPassTitle"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
        child: Form(
          key: controller.formkey,
          child: GetBuilder<resetPasswordImp>(builder: (context) {
            return HandleingRequsetData(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    const SizedBox(height: 30),
                    customField(
                        validator: (value) {
                          return ValidateInputs(value!, "password", 8, 30);
                        },
                        textEditingController: controller.newPass,
                        lable: 'newPass'.tr,
                        isPass: controller.passVisibility,
                        icon: controller.passVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        iconPress: () => controller.passVisible(),
                        hint: "newPass".tr),
                    const SizedBox(height: 10),
                    customField(
                        validator: (value) {
                          return PasswordConfirmation(controller.newPass.text,
                              controller.reNewPass.text);
                        },
                        textEditingController: controller.reNewPass,
                        lable: 'passConfirm'.tr,
                        isPass: controller.confirmPassVisibility,
                        icon: controller.confirmPassVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        iconPress: () => controller.confirmPassVisible(),
                        hint: "passConfirm".tr),
                    const SizedBox(height: 20),
                    BTN(
                        lable: 'reset'.tr,
                        press: () {
                          controller.resetPassword();
                        },
                        width: 350),
                  ],
                ));
          }),
        ),
      ),
    );
  }
}
