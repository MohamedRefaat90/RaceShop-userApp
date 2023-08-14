import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handelDataController.dart';
import 'package:ecommerce/core/services/myServices.dart';
import 'package:ecommerce/data/Model/CategoriesModel.dart';
import 'package:ecommerce/data/dataSource/remote/Home/homeData.dart';
import 'package:get/get.dart';

import '../../core/constants/AppRoutes.dart';

abstract class HomeController extends GetxController {
  getData();
  goToCategoryProducts(int selectedCat);
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  List categoriesList = [];
  List productList = [];
  String? lang;
  @override
  getData() async {
    categoriesList.clear();
    statusRequest = StatusRequest.loading;

    var response = await homeData.getAllData();
    statusRequest = handelData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // categoriesList.addAll(response['data']['data']);

        for (int i = 0; i < response['data']['data'].length; i++) {
          categoriesList
              .add(CategoriesModel.fromJson(response['data']['data'][i]));
        }
        // productList.addAll(response['products']);
        print("Data Arrived Succesfully");
      } else {
        print("Data NOT Arrived");
      }
    } else {
      print("Error Because ===> $response");
    }

    update();
  }

  @override
  goToCategoryProducts(int selectedCat) {
    Get.toNamed(AppRoutes.categoryProduts, arguments: {
      "categories": categoriesList,
      "selectedCategoryIndex": selectedCat
    });
    // print(selectedCat);
  }

  @override
  void onInit() async {
    lang = myServices.sharedPreferences.getString('lang');
    getData();
    super.onInit();
  }
}
