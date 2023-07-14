import 'package:ecommerce/core/localization/changeLanguage.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/view/screens/Languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/localization/transilation.dart';
import 'core/services/myServices.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      translations: MyTransilation(),
      locale: controller.language,
      home: const Languages(),
      routes: routes,
      theme: controller.theme,
    );
  }
}
