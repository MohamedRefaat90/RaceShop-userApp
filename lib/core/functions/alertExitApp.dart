import 'dart:io';

import 'package:ecommerce/core/shared/BTN.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AlertExitApp() {
  Get.defaultDialog(
      title: "alertTitle".tr,
      content: Text('alertDesc'.tr),
      actions: [
        BTN(
            lable: 'yes'.tr,
            width: 80,
            color: Colors.red,
            press: () {
              exit(0);
            }),
        BTN(
            lable: 'no'.tr,
            width: 80,
            color: Colors.green,
            press: () {
              Get.back();
            })
      ]);
}
