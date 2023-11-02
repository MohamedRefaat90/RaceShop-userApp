import 'package:ecommerce/core/services/myServices.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  bool notificationEnable = true;

  late String phoneOwner;
  late String whatsappOwner;

  @override
  void onInit() {
    phoneOwner = myServices.sharedPreferences.getString("phoneOwner")!;
    whatsappOwner = myServices.sharedPreferences.getString("whatsappOwner")!;
    super.onInit();
  }
}
