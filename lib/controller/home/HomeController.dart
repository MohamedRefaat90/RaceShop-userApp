import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/Model/CategoriesModel.dart';
import 'package:race_shop/data/Model/userModel.dart';
import 'package:race_shop/data/dataSource/remote/Home/homeData.dart';
import 'package:get/get.dart';
import 'package:race_shop/data/Model/productModel.dart';
import '../../core/constants/AppRoutes.dart';
import '../../data/dataSource/remote/offers/offersData.dart';

abstract class HomeController extends GetxController {
  getCategories();
  goToCategoryProducts(int selectedCat);
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(Get.find());
  offersData OffersData = offersData(Get.find());
  MyServices myServices = Get.find();
  userModel? user;
  StatusRequest? statusRequest;
  List categoriesList = [];
  List offersProducts = [];

  @override
  void onInit() {
    user = Get.arguments;
    getCategories();
    getOffersProducts();
    super.onInit();
  }

  @override
  getCategories() async {
    categoriesList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getAllData();
    statusRequest = handelData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        for (int i = 0; i < response['data']['data'].length; i++) {
          categoriesList
              .add(CategoriesModel.fromJson(response['data']['data'][i]));
        }
      }
    }
    update();
  }

  @override
  goToCategoryProducts(int selectedCat) {
    Get.toNamed(AppRoutes.categoryProduts, arguments: {
      "categories": categoriesList,
      "selectedCategoryIndex": selectedCat
    });
  }

  getOffersProducts() async {
    offersProducts.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await OffersData.getOffersProducts();

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List products = response['data']['data']
            .map((e) => productModel.formjson(e))
            .toList();
        offersProducts.addAll(products);
        products.clear();
      }
    }
    update();
  }

  goToProductDetails(productModel product, int index) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"product": product, "index": index});
  }
}
