import 'package:ecommerce/Bindings/myBindings.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/core/localization/changeLanguage.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/transilation.dart';
import 'core/services/myServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();
  runApp(const Ecommerce());
}

class Ecommerce extends GetView<LanguageController> {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: controller.theme,
      locale: controller.language,
      translations: MyTransilation(),
      initialBinding: myBindings(),
      initialRoute: AppRoutes.home,
      getPages: routes,
    );
  }
}
