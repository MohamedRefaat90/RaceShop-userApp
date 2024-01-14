import 'package:race_shop/data/Model/OrderModel.dart';
import 'package:get/get.dart';

class orderDetailsController extends GetxController {
  late OrderModel order;

  @override
  void onInit() {
    super.onInit();
    order = Get.arguments['order'];
  }
}
