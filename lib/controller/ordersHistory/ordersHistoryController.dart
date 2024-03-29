import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/dataSource/remote/Orders/OrdersData.dart';
import 'package:get/get.dart';

class ordersHistoryController extends GetxController {
  String? userToken;
  StatusRequest? statusRequest;
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(Get.find());
  List compeletedOrders = [];

  @override
  void onInit() {
    userToken = myServices.sharedPreferences.getString("userToken");
    getCompeletedOrders();
    super.onInit();
  }

  getCompeletedOrders() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersData.getCompeltedOrders(userToken!);
    statusRequest = handelData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        compeletedOrders.addAll(response['data']['data']);
      }
    }
    update();
  }
}
