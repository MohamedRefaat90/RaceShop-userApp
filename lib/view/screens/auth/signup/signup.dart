import 'package:race_shop/controller/auth/signup.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:race_shop/core/class/statusRequest.dart';

import '../../../../core/constants/AppColors.dart';
import '../../../../core/functions/validateInputs.dart';
import '../../../../core/shared/BTN.dart';
import '../../../../core/shared/customAppBar.dart';
import '../../../../core/shared/customField.dart';
import '../../../../core/shared/HandleingRequsetData.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupControllerImp controller = Get.put(SignupControllerImp());
    return Scaffold(
      appBar: customAppBar(context, "signup"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formkey,
            child: GetBuilder<SignupControllerImp>(builder: (controller) {
              return Column(
                children: [
                  const SizedBox(height: 60),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: customField(
                            validator: (value) {
                              return ValidateInputs(
                                  value!.trim(), "username", 3, 30);
                            },
                            textEditingController: controller.firstName,
                            lable: 'firstName'.tr,
                            hint: "firstName".tr),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: customField(
                            validator: (value) {
                              return ValidateInputs(
                                  value!.trim(), "username", 3, 30);
                            },
                            textEditingController: controller.lastName,
                            lable: 'lastName'.tr,
                            hint: "lastName".tr),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  customField(
                      validator: (value) {
                        return ValidateInputs(value!.trim(), "email", 5, 30);
                      },
                      textEditingController: controller.email,
                      lable: 'email'.tr,
                      icon: Icons.email_outlined,
                      hint: "enterEmail".tr),
                  const SizedBox(height: 20),
                  customField(
                      validator: (value) {
                        return ValidateInputs(value!.trim(), "phone", 11, 30);
                      },
                      textEditingController: controller.phone,
                      lable: 'phone'.tr,
                      isPhone: true,
                      icon: Icons.phone,
                      hint: "enterPhone".tr),
                  const SizedBox(height: 20),
                  GetBuilder<SignupControllerImp>(builder: (context) {
                    return customField(
                        validator: (value) {
                          return ValidateInputs(
                              value!.trim(), "password", 8, 30);
                        },
                        textEditingController: controller.password,
                        isPass: controller.passVisibility,
                        lable: 'password'.tr,
                        icon: context.passVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        iconPress: () => controller.passVisible(),
                        hint: "enterPass".tr);
                  }),
                  const SizedBox(height: 20),
                  GetBuilder<SignupControllerImp>(builder: (context) {
                    return customField(
                        validator: (value) {
                          return PasswordConfirmation(controller.password.text,
                              controller.confirmPassword.text);
                        },
                        textEditingController: controller.confirmPassword,
                        isPass: controller.confirmPassVisibility,
                        lable: 'passConfirm'.tr,
                        icon: context.confirmPassVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        iconPress: () => context.confirmPassVisible(),
                        hint: "passConfirm".tr);
                  }),
                  const SizedBox(height: 40),
                  BTN(
                      widget: controller.statusRequest == StatusRequest.loading
                          ? SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                color: AppColors.white,
                              ),
                            )
                          : Text('signup'.tr),
                      press: () {
                        if (controller.formkey.currentState!.validate()) {
                          controller.signup(context);
                        }
                      },
                      width: 350),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("haveAcc".tr),
                      TextButton(
                          onPressed: () {
                            controller.goToLogin();
                          },
                          child: Text(
                            'signin'.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ))
                    ],
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
