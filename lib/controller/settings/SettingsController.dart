import 'package:race_shop/core/services/myServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../LanguageController/LanguageController.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  LanguageController languageController = Get.find();
  bool? isDarkMode;

  late String phoneOwner;
  late String whatsappOwner;

  @override
  void onInit() {
    phoneOwner = myServices.sharedPreferences.getString("phoneOwner")!;
    whatsappOwner = myServices.sharedPreferences.getString("whatsappOwner")!;
    isDarkMode = myServices.sharedPreferences.getBool("isDarkMode") ?? false;
    super.onInit();
  }

  ToggelDarkMode(bool val) {
    myServices.sharedPreferences.setBool("isDarkMode", val);
    isDarkMode = val;
    languageController.themeMode =
        isDarkMode! ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(languageController.themeMode);
    update();
  }
}
