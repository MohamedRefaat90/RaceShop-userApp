import 'package:race_shop/ApiLinks.dart';
import 'package:race_shop/core/class/DB_helper.dart';

class OrdersData {
  final DB_helper db_helper;

  OrdersData(this.db_helper);

  getAllOrders(
      {required String userToken,
      required int page,
      required int numofOrdersPerRequest}) async {
    var response = await db_helper.getAllData(
        "${ApiLinks.orders}?page=$page&limit=$numofOrdersPerRequest&sort=desc",
        userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }

  cancelOrder(String OrderID, String userToken) async {
    var response = await db_helper.postData(
        "${ApiLinks.orders}/cancel/$OrderID", {},
        userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }

  getCompeltedOrders(String userToken) async {
    var response = await db_helper.getAllData(
        "${ApiLinks.orders}?page=1&limit=20&sort=desc&status=completed",
        userToken: userToken);
    return response.fold((l) => l, (r) => r);
  }
}
