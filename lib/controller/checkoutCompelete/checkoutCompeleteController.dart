import 'package:get/get.dart';

class CheckoutCompeleteController extends GetxController {
  late int? BillID;

  @override
  void onInit() {
    BillID = Get.arguments;
    super.onInit();
  }
}
