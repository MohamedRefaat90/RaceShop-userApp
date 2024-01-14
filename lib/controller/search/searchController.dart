import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/Model/productModel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/constants/AppRoutes.dart';
import '../../data/dataSource/remote/Search/SearchData.dart';

class SearchBarController extends GetxController {
  bool isSearch = false;
  SearchData searchData = SearchData(Get.find());
  MyServices myServices = Get.find();
  late String userToken;
  StatusRequest? statusRequest;
  List searchedProducts = [];
  late TextEditingController searchController;
  @override
  void onInit() {
    userToken = myServices.sharedPreferences.getString('userToken')!;
    searchController = TextEditingController();
    super.onInit();
  }

  checkSearch(bool searchIsEmpty) {
    if (searchIsEmpty == true) {
      isSearch = false;
    }
    update();
  }

  isSearching() {
    isSearch = true;
    update();
  }

  getSearchedData({required String searchedWord}) async {
    searchedProducts.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await searchData.getSearchedData(userToken, searchedWord: searchedWord);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        searchedProducts = response['data']['data']
            .map((e) => productModel.formjson(e))
            .toList();
      }
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
    update();
  }

  clearSearch() {
    searchController.clear();
    isSearch = false;
    update();
  }

  goToProductDetails(product, index) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"product": product, "index": index});
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
