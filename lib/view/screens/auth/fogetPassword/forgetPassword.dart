import 'package:race_shop/controller/auth/forgetPassword.dart';
import 'package:race_shop/core/shared/HandleingRequsetData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/validateInputs.dart';
import '../../../../core/shared/BTN.dart';
import '../../../../core/shared/customAppBar.dart';
import '../../../../core/shared/customField.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    forgetPasswordImp controller = Get.put(forgetPasswordImp());
    return Scaffold(
      appBar: customAppBar(context, "forgetPass"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
        child: Form(
          key: controller.formkey,
          child: GetBuilder<forgetPasswordImp>(builder: (controller) {
            return HandleingRequsetData(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    Text(
                      'forgetPassDesc'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 17),
                    ),
                    const SizedBox(height: 40),
                    customField(
                        validator: (value) {
                          return ValidateInputs(value!.trim(), "email", 5, 30);
                        },
                        textEditingController: controller.email,
                        lable: 'email'.tr,
                        icon: Icons.email_outlined,
                        hint: "enterEmail".tr),
                    const SizedBox(height: 60),
                    BTN(
                        widget: Text('check'.tr),
                        press: () {
                          controller.goToVarificationCode();
                        },
                        width: 350),
                    const SizedBox(height: 20),
                  ],
                ));
          }),
        ),
      ),
    );
  }
}
