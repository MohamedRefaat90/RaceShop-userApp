import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/tooltip/tooltip_box.dart';
import 'package:another_xlider/models/tooltip/tooltip_position_offset.dart';
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
                    // physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BTN(
                                  lable: 'highestPrice'.tr,
                                  press: () => controller.getCategoryProducts(
                                      categoryID: controller
                                          .categoriesList[
                                              controller.selectedCat]
                                          .categoryID,
                                      sort: "desc",
                                      minPrice: 0,
                                      maxPrice: 50000),
                                  padding: 10),
                              const SizedBox(width: 10),
                              // const SizedBox(width: 50),
                              BTN(
                                  lable: 'lowestPrice'.tr,
                                  press: () => controller.getCategoryProducts(
                                      categoryID: controller
                                          .categoriesList[
                                              controller.selectedCat]
                                          .categoryID,
                                      sort: "aesc",
                                      minPrice: 0,
                                      maxPrice: 50000),
                                  padding: 10),
                              const SizedBox(width: 10),
                              BTN(
                                  lable: 'MostRecent'.tr,
                                  press: () {},
                                  padding: 10),
                              const SizedBox(width: 10),
                              // const SizedBox(width: 50),
                              BTN(lable: 'Oldest'.tr, press: () {}, padding: 10)
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
        controller.changeSliderValuse(
            lowerValue: lowerValue, upperValue: upperValue);
      },
    );
  }
}
