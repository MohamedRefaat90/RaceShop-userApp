import 'package:ecommerce/core/functions/alertExitApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/AppAssets.dart';
import '../../../../core/constants/AppRoutes.dart';
import '../../../../core/shared/BTN.dart';

class SuccessResetPass extends StatelessWidget {
  const SuccessResetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () => AlertExitApp(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.resetPassword, width: 200, repeat: true),
            Text(
              'succuesResetPass'.tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            BTN(
                lable: 'Login',
                press: () {
                  Get.offAllNamed(AppRoutes.login);
                })
          ],
        ),
      ),
    ));
  }
}
