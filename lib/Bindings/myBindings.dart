import 'package:ecommerce/core/class/DB_helper.dart';
import 'package:get/get.dart';

class myBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DB_helper());
  }
}
