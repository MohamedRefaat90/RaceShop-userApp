import 'dart:async';

import 'package:flutter/services.dart';
import 'package:race_shop/core/constants/AppTheme.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

class LanguageController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  ThemeData theme = themeEnglish;
  ThemeMode themeMode = ThemeMode.light;
  String? lang;
  String? sharedLang;

// Deep Linking
  bool initialURILinkHandled = false;
  Uri? initialURI;
  Uri? currentURI;
  Object? erro;

  StreamSubscription? streamSubscription;

  // for if First Time Open the App .. will Take Device Language
  @override
  void onInit() {
    // initUniLinks();
    incomingLinkHandler();
    sharedLang = myServices.sharedPreferences.getString('lang');
    bool? isDarkMode =
        myServices.sharedPreferences.getBool("isDarkMode") ?? false;
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    if (sharedLang == "ar") {
      language = const Locale('ar');
      theme = themeArabic;
    } else if (sharedLang == 'en') {
      language = const Locale('en');
      theme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }

  void incomingLinkHandler() {
    // 1
    if (!kIsWeb) {
      // 2
      streamSubscription = uriLinkStream.listen((Uri? uri) {
        // debugPrint('Received URI: $uri');

        String currentURI = uri.toString();
        String path = currentURI.substring(34);

        Get.toNamed(path);
        erro = null;
        update();
        // 3
      }, onError: (Object err) {
        debugPrint('Error occurred: $err');

        currentURI = null;
        if (err is FormatException) {
          erro = err;
        } else {
          erro = null;
        }
        update();
      });
    }
  }

  changeLanguage(String langCode) {
    lang = langCode;
    language = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    theme = langCode == 'ar' ? themeArabic : themeEnglish;
    sharedLang = myServices.sharedPreferences.getString('lang');
    Get.changeTheme(theme);
    Get.updateLocale(language!);
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
}
