import 'package:race_shop/controller/auth/login.dart';
import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/constants/AppColors.dart';
import 'package:race_shop/core/constants/AppAssets.dart';
import 'package:race_shop/core/functions/alertExitApp.dart';
import 'package:race_shop/core/functions/validateInputs.dart';
import 'package:race_shop/core/shared/BTN.dart';
import 'package:race_shop/core/shared/HandleingRequsetData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/customAppBar.dart';
import '../../../../core/shared/customField.dart';
import '../../../widgets/Auth/AuthTitle.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  // GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      appBar: customAppBar(context, "signin".tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
        child: WillPopScope(
          onWillPop: () => AlertExitApp(),
          child: GetBuilder<LoginController>(builder: (controller) {
            return SingleChildScrollView(
              child: Form(
                key: controller.formkey,
                child: Column(
                  children: [
                    Image.asset(AppAssets.logo, width: 230),
                    const AuthTitle(),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0)),
                    const SizedBox(height: 30),
                    customField(
                        validator: (value) {
                          return ValidateInputs(value!.trim(), "email", 5, 30);
                        },
                        textEditingController: controller.email,
                        lable: 'email'.tr,
                        icon: Icons.email_outlined,
                        hint: "enterEmail".tr),
                    const SizedBox(height: 20),
                    GetBuilder<LoginController>(builder: (context) {
                      return customField(
                          validator: (value) {
                            return ValidateInputs(
                                value!.trim(), "password", 8, 30);
                          },
                          textEditingController: controller.password,
                          isPass: controller.visibility,
                          lable: 'password'.tr,
                          icon: !controller.visibility
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          iconPress: () => controller.passVisible(),
                          hint: "enterPass".tr);
                    }),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text('forgetPass'.tr),
                        onPressed: () {
                          controller.goToForgetPassword();
                        },
                      ),
                    ),
                    BTN(
                      widget: controller.statusRequest == StatusRequest.loading
                          ? SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                  color: AppColors.white, strokeWidth: 4),
                            )
                          : Text('signin'.tr),
                      press: () {
                        if (controller.formkey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                      width: 350,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("donthaveAcc".tr),
                        TextButton(
                            onPressed: () {
                              controller.goToSignup();
                            },
                            child: Text(
                              'signup'.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
