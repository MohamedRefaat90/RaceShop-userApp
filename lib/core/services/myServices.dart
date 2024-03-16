// import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("phoneOwner", "01025181548");
    sharedPreferences.setString("whatsappOwner", "0201025181548");

    return this;
  }
}

initServices() async {
  await Get.putAsync(() => MyServices().init());
}
