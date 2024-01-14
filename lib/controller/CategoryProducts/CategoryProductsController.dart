import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/Model/productModel.dart';
import 'package:race_shop/data/dataSource/remote/CategoryProducts/CategoryProductsData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CategoryProductsController extends GetxController {
  getCategoryProducts(
      {required String categoryID,
      double? minPrice,
      double? maxPrice,
      String? sort,
      String? sortBy,
      int? limit,
      int? page});
  goToProductDetails(productModel product, int index);
  changeSliderValues({required double lowerValue, required double upperValue});
}

class CategoryProductsControllerImp extends CategoryProductsController {
  late int selectedCat;
  StatusRequest statusRequest = StatusRequest.loading;
  CategoryProductsData categoryProductsData = CategoryProductsData(Get.find());
  MyServices myServices = Get.find();
  late String userToken;
  List categoryProducts = [];

  double minPrice = 0;
  double maxPrice = 50000;

  // price Slider
  double lowerPrice = 1000;
  double hightPrice = 15000;

  late List categoriesList;

  late ScrollController scrollController;
  late int totalItems;
  late int pageNumber;
  late bool loading;
  final int numOfProductsPerRequest = 20;
  int? totalPages;
  @override
  void onInit() {
    categoriesList = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCategoryIndex'];
    userToken = myServices.sharedPreferences.getString('userToken')!;
    scrollController = ScrollController();
    pageNumber = 1;
    loading = false;

    getCategoryProducts(
        categoryID: categoriesList[selectedCat].categoryID,
        minPrice: minPrice,
        maxPrice: maxPrice,
        page: pageNumber,
        limit: numOfProductsPerRequest,
        sort: "desc",
        sortBy: "price");

    scrollController.addListener(pagination);

    super.onInit();
  }

  pagination() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        (pageNumber <= totalPages!)) {
      loading = true;
      pageNumber++;

      getCategoryProducts(
          categoryID: categoriesList[selectedCat].categoryID,
          minPrice: minPrice,
          maxPrice: maxPrice,
          page: pageNumber,
          limit: categoryProducts.length,
          sort: "desc",
          sortBy: "price");

      update();
    }
  }

  @override
  getCategoryProducts(
      {required categoryID,
      minPrice,
      maxPrice,
      sort,
      sortBy,
      page,
      limit}) async {
    var response = await categoryProductsData.getCategoryProductsData(
        categoryID: categoryID,
        minPrice: minPrice,
        maxPrice: maxPrice,
        sort: sort,
        sortBy: sortBy,
        page: pageNumber,
        limit: numOfProductsPerRequest,
        userToken: userToken);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        totalItems = response['data']['totalItems'];
        totalPages = response['data']['totalPages'];

        List products = response['data']['data']
            .map((e) => productModel.formjson(e))
            .toList();
        categoryProducts.addAll(products);
      }
    } else {
      statusRequest =
          categoryProducts.isEmpty ? StatusRequest.failure : StatusRequest.none;
      loading = false;
    }

    update();
  }

  @override
  goToProductDetails(product, index) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"product": product, "index": index});
  }

  @override
  changeSliderValues({required lowerValue, required upperValue}) {
    lowerPrice = lowerValue;
    hightPrice = upperValue;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
