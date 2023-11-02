import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/search/searchController.dart';
import '../constants/AppColors.dart';

class Searchbar_with_NotificationIcon extends GetView<SearchBarController> {
  const Searchbar_with_NotificationIcon({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SearchBarController());
    return GetBuilder<SearchBarController>(builder: (context) {
      return Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0)
                  .copyWith(left: 3, right: 0),
              child: TextField(
                controller: controller.searchController,
                onChanged: (value) {
                  controller.checkSearch(value.isEmpty);
                },
                onSubmitted: (value) {
                  controller.isSearching();
                  print(value);
                  print(controller.searchController.text);
                  controller.getSearchedData(
                      searchedWord: controller.searchController.text);
                },
                decoration: InputDecoration(
                    hintText: "findProduct".tr,
                    prefixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    suffixIcon: controller.isSearch
                        ? IconButton(
                            onPressed: () {
                              controller.clearSearch();
                            },
                            icon: Icon(Icons.cancel, color: Colors.red))
                        : null,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: AppColors.black),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.notifications);
              },
              padding: const EdgeInsets.all(0),
              icon: const Icon(Icons.notifications_outlined,
                  size: 35, color: AppColors.primaryColor))
        ],
      );
    });
  }
}
