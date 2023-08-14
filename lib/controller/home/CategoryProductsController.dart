import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/core/functions/handelDataController.dart';
import 'package:ecommerce/core/services/myServices.dart';
import 'package:ecommerce/data/Model/productModel.dart';
import 'package:ecommerce/data/dataSource/remote/CategoryProducts/CategoryProductsData.dart';
import 'package:get/get.dart';

abstract class CategoryProductsController extends GetxController {
  getCategoryProducts({
    required String categoryID,
    double? minPrice,
    double? maxPrice,
    String? sort,
  });

  changeCategoryBarIndicator(int index);
  goToProductDetails(productModel product, int index);
  changeSliderValuse({required double lowerValue, required double upperValue});
}

class CategoryProductsControllerImp extends CategoryProductsController {
  late int selectedCat;
  StatusRequest? statusRequest;
  CategoryProductsData categoryProductsData = CategoryProductsData(Get.find());
  MyServices myServices = Get.find();
  late String userToken;
  // late CategoriesModel categoriesModel;
  List categoryProducts = [];
  double lowerPrice = 0;
  double hightPrice = 0;
  late List categoriesList;

  @override
  void onInit() {
    categoriesList = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCategoryIndex'];
    userToken = myServices.sharedPreferences.getString('userToken')!;
    getCategoryProducts(categoryID: categoriesList[selectedCat].categoryID);

    super.onInit();
  }

  @override
  getCategoryProducts({
    required categoryID,
    minPrice = 0,
    maxPrice = 10000,
    sort = "desc",
  }) async {
    categoryProducts.clear();
    statusRequest = StatusRequest.loading;
    update();
    // print(categoryID);
    var response = await categoryProductsData.getCategoryProductsData(
        categoryID: categoryID,
        minPrice: minPrice!,
        maxPrice: maxPrice!,
        sort: sort!,
        userToken: userToken);
    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        categoryProducts.addAll(response['data']['data']);
      }
    } else {
      statusRequest = StatusRequest.failure;
      // print(response.toString());
    }
    update();
  }

  @override
  changeCategoryBarIndicator(int index) {
    selectedCat = index;
    update();
  }

  @override
  goToProductDetails(product, index) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"product": product, "index": index});
  }

  @override
  changeSliderValuse({required lowerValue, required upperValue}) {
    lowerPrice = lowerValue;
    hightPrice = upperValue;
  }
}
