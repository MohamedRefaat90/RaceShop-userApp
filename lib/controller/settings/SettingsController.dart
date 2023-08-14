import 'package:ecommerce/core/services/myServices.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  bool notificationEnable = true;
}
