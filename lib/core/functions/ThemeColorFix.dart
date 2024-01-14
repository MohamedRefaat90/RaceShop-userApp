import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:race_shop/controller/LanguageController/LanguageController.dart';

import '../../controller/home/HomeController.dart';
import '../constants/AppColors.dart';

Color ThemeColorFix() {
  LanguageController languageController = Get.find();

  if (languageController.myServices.sharedPreferences.getBool("isDarkMode") ??
      false) {
    return AppColors.white;
  } else {
    return AppColors.black;
  }
}
