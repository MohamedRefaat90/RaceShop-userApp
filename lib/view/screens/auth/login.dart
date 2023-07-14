import 'package:ecommerce/controller/auth/login.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/constants/AppAssets.dart';
import 'package:ecommerce/core/functions/alertExitApp.dart';
import 'package:ecommerce/core/functions/validateInputs.dart';
import 'package:ecommerce/core/shared/BTN.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/customAppBar.dart';
import '../../../core/shared/customField.dart';
import '../../widgets/Auth/AuthBodytitle.dart';
import '../../widgets/Auth/AuthTitle.dart';

class Login extends GetView<LoginControllerImp> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: customAppBar(context, "signin"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 40),
        child: WillPopScope(
          onWillPop: () => AlertExitApp(),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formkey,
              child: Column(
                children: [
                  Image.asset(AppAssets.logo, width: 230),
                  const AuthTitle(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: AuthBodytitle(),
                  ),
                  const SizedBox(height: 30),
                  customField(
                      validator: (value) {
                        return ValidateInputs(value!.trim(), "email", 5, 30);
                      },
                      lable: 'email'.tr,
                      icon: Icons.email_outlined,
                      hint: "enterEmail".tr),
                  const SizedBox(height: 20),
                  GetBuilder<LoginControllerImp>(builder: (context) {
                    return customField(
                        validator: (value) {
                          return ValidateInputs(
                              value!.trim(), "password", 8, 30);
                        },
                        isPass: controller.visibility,
                        lable: 'password'.tr,
                        icon: !context.visibility
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        iconPress: () => context.passVisible(),
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
                    lable: 'signin'.tr,
                    press: () {
                      controller.login();
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
          ),
        ),
      ),
    );
  }
}
