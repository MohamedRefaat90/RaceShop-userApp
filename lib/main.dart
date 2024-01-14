import 'package:race_shop/Bindings/myBindings.dart';
import 'package:race_shop/controller/LanguageController/LanguageController.dart';
import 'package:race_shop/controller/auth/login.dart';
import 'package:race_shop/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constants/AppRoutes.dart';
import 'core/localization/transilation.dart';
import 'core/services/myServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(const race_shop());
}

class race_shop extends GetView<LanguageController> {
  const race_shop({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());
    // Get.put(LoginController());

    return GetBuilder<LanguageController>(builder: (context) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: controller.theme,
          themeMode: controller.themeMode,
          locale: controller.language,
          translations: MyTransilation(),
          initialBinding: myBindings(),
          darkTheme: ThemeData.dark(useMaterial3: true),
          // initialRoute: AppRoutes.login,
          // initialRoute: AppRoutes.test,
          getPages: routes);
    });
  }
}
