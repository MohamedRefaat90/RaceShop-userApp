import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handelDataController.dart';
import 'package:ecommerce/core/services/myServices.dart';
import 'package:ecommerce/data/dataSource/remote/Orders/OrdersData.dart';
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
