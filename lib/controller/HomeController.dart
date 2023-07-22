import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/data/dataSource/remote/homeData.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  getData();
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(Get.find());
  StatusRequest? statusRequest;
  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.getAllData();

    if (response == StatusRequest.success) {
      if (response['status'] == "success") {
        print("Data Arrived Succesfully");
      } else {
        print("Data NOT Arrived");
      }
    } else {
      print("Error Because ===> $response");
    }
  }
}
