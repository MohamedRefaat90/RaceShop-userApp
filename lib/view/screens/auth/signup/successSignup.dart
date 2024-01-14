import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/core/functions/alertExitApp.dart';
import 'package:race_shop/core/shared/BTN.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/AppAssets.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: WillPopScope(
        onWillPop: () => AlertExitApp(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.success, width: 200, repeat: false),
            Text(
              'successSignup'.tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            BTN(
                widget: Text('signin'.tr),
                press: () {
                  Get.offAllNamed(AppRoutes.login);
                })
          ],
        ),
      ),
    ));
  }
}
