import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:race_shop/controller/LanguageController/LanguageController.dart';

import '../../../core/constants/AppAssets.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.find();
    return Center(
        child: Lottie.asset(languageController.themeMode == ThemeMode.light
            ? AppAssets.DarkLoading
            : AppAssets.LightLoading));
  }
}
