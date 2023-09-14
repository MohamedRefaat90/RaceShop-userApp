import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/tooltip/tooltip_box.dart';
import 'package:another_xlider/models/tooltip/tooltip_position_offset.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/CategoryProductsController.dart';
import '../../../core/shared/BTN.dart';

class Filters extends GetView<CategoryProductsControllerImp> {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.selectedCat);
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ExpansionTile(
            title: Row(children: [
              const Icon(Icons.filter_alt),
              const SizedBox(width: 10),
              Text("Filters".tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18))
            ]),
            expandedAlignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 200,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BTN(
                                  widget: Text('highestPrice'.tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  press: () async {
                                    controller.statusRequest =
                                        StatusRequest.loading;
                                    controller.update();
                                    print(
                                        "num of Produtcr => ${controller.categoryProducts.length}");
                                    await controller.getCategoryProducts(
                                        categoryID: controller
                                            .categoriesList[
                                                controller.selectedCat]
                                            .categoryID,
                                        sort: "desc",
                                        sortBy: "price",
                                        page: 1,
                                        limit: 12,
                                        minPrice: controller.minPrice,
                                        maxPrice: controller.maxPrice);
                                  },
                                  padding: 10),
                              const SizedBox(width: 10),
                              // const SizedBox(width: 50),
                              BTN(
                                  widget: Text('lowestPrice'.tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  press: () async {
                                    controller.statusRequest =
                                        StatusRequest.loading;
                                    controller.update();
                                    // controller.categoryProducts.clear();
                                    controller.getCategoryProducts(
                                        categoryID: controller
                                            .categoriesList[
                                                controller.selectedCat]
                                            .categoryID,
                                        sort: "aesc",
                                        page: 1,
                                        sortBy: "price",
                                        limit:
                                            controller.categoryProducts.length,
                                        minPrice: controller.minPrice,
                                        maxPrice: controller.maxPrice);
                                    controller.update();
                                    print("num of prod =>" +
                                        controller.categoryProducts.length
                                            .toString());
                                  },
                                  padding: 10),
                              const SizedBox(width: 10),
                              BTN(
                                  widget: Text(
                                    'MostRecent'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  press: () {
                                    controller.statusRequest =
                                        StatusRequest.loading;
                                    controller.update();
                                    controller.getCategoryProducts(
                                        categoryID: controller
                                            .categoriesList[
                                                controller.selectedCat]
                                            .categoryID,
                                        sort: "desc",
                                        sortBy: "createdAt");
                                  },
                                  padding: 10),
                              const SizedBox(width: 10),
                              // const SizedBox(width: 50),
                              BTN(
                                  widget: Text(
                                    'Oldest'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  press: () {
                                    controller.statusRequest =
                                        StatusRequest.loading;
                                    controller.update();
                                    controller.getCategoryProducts(
                                        categoryID: controller
                                            .categoriesList[
                                                controller.selectedCat]
                                            .categoryID,
                                        sort: "aesc",
                                        sortBy: "createdAt");
                                  },
                                  padding: 10)
                            ]),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: SliderPrice()),
                      TextButton(
                          onPressed: () {
                            controller.getCategoryProducts(
                                categoryID: controller
                                    .categoriesList[controller.selectedCat]
                                    .categoryID,
                                minPrice: controller.lowerPrice,
                                maxPrice: controller.hightPrice,
                                sort: "desc");
                            print(controller.selectedCat);
                            controller.update();
                          },
                          child: const Text('Search',
                              style: TextStyle(color: Colors.blue)))
                    ]),
              )
            ]));
  }
}

class SliderPrice extends GetView<CategoryProductsControllerImp> {
  const SliderPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSlider(
      values: const [1550, 10000],
      rangeSlider: true,
      tooltip: FlutterSliderTooltip(
          positionOffset: FlutterSliderTooltipPositionOffset(top: -20),
          boxStyle: FlutterSliderTooltipBox(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(50))),
          alwaysShowTooltip: true,
          textStyle: const TextStyle(fontWeight: FontWeight.bold)),
      max: 20000,
      min: 1000,
      onDragging: (handlerIndex, lowerValue, upperValue) {
        controller.changeSliderValues(
            lowerValue: lowerValue, upperValue: upperValue);
      },
    );
  }
}
