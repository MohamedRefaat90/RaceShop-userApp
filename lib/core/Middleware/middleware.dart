import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class LanguageMiddleware extends GetMiddleware {
  @override
  int? get priority => 0;
  static MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool("isFirstTime") == false) {
      return const RouteSettings(name: AppRoutes.home);
    }
    return super.redirect(route);
  }
}

class LoginMiddleware extends GetMiddleware {
  @override
  int? get priority => 0;
  static MyServices myServices = Get.find();
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool("isLogin") == false) {
      return const RouteSettings(name: AppRoutes.login);
    } else {
      return super.redirect(route);
    }
  }
}
