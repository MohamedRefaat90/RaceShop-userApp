import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handelDataController.dart';
import 'package:ecommerce/core/services/myServices.dart';

import 'package:ecommerce/data/dataSource/remote/Orders/OrdersData.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ordersController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  OrdersData ordersData = OrdersData(Get.find());
  String? userToken;
  MyServices myServices = Get.find();
  List orders = [];
  int activeStep = 0;
  late IO.Socket socket;
  late ScrollController scrollController;
  bool loading = false;
  int pageNumber = 1;
  int? totalPages;
  @override
  void onInit() {
    userToken = myServices.sharedPreferences.getString("userToken");
    scrollController = ScrollController();
    initSocket();
    getAllOrders();
    scrollController.addListener(pagination);
    super.onInit();
  }

  pagination() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        (pageNumber <= totalPages!)) {
      loading = true;
      pageNumber++;

      getAllOrders();

      update();
    }
  }

  initSocket() {
    socket = IO.io(
        "https://ecommerce-api-lrnu.onrender.com",
        IO.OptionBuilder().setTransports(['websocket']).setAuth(
            {'auth': userToken}).setQuery({'auth': userToken}).build());
    socket.on('connect', (data) => print("Connected to server"));
    socket.onConnect((_) => print('Connection established'));
    socket.onReconnecting((_) => print('Reconnecting'));
    socket.onReconnectAttempt((_) => print('onReconnectAttempt'));
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err + " onConnectError"));
    socket.onError((err) => print(err + " onError"));
  }

  getAllOrders() async {
    var response =
        await ordersData.getAllOrders(userToken: userToken!, page: pageNumber);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        totalPages = response['data']['totalPages'];
        orders.addAll(response['data']['data'].map((e) {
          if (e['status'] != "completed") return e;
        }));
      }
    } else {
      statusRequest = StatusRequest.success;
      loading = false;
    }

    update();
  }

  cancelOrder(String orderID) async {
    await ordersData.cancelOrder(orderID, userToken!);

    getAllOrders();
  }

  changeStepper(String orderStatus) {
    switch (orderStatus) {
      case "pending":
        activeStep = 0;
        break;
      case "outForDeleviery":
        activeStep = 1;
        break;
      case "completed":
        activeStep = 3;
        break;
      default:
        activeStep = 0;
    }
  }

  @override
  void dispose() {
    socket.disconnect();
    socket.dispose();
    scrollController.dispose();
    super.dispose();
  }
}



// const socket = io("https://ecommerce-api-lrnu.onrender.com", {
//   auth: {
//     token,
//   },
// });

// socket.on("connect", () => {
//   console.log("Connected to server");
//   document.getElementById("socketConnect").textContent = "Socket connected";
// });

// socket.on("orderAdded", (order) => {
//   console.log(order: ${JSON.stringify(order)});
//   // use the order doc here
//   // 
//   document.getElementById("socketEventAdded").textContent = "Order Added";
// });

