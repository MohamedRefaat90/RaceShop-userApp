import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/productDetails/ProductController.dart';
import '../../../core/constants/AppColors.dart';

class imageSlider extends GetView<ProductDetailsControllerImp> {
  const imageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 25),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: AppColors.black),
        ),
        child: Column(children: [
          CarouselSlider.builder(
              itemCount: controller.product.productImages.length,
              options: CarouselOptions(
                height: 270.0,
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.7,
                onPageChanged: (index, reason) {
                  controller.changeImageSliderIndicator(index);
                },
              ),
              itemBuilder: (context, index, realIndex) => CachedNetworkImage(
                  imageUrl: controller.product.productImages[index])),
          const imageSliderIndicators()
        ]));
  }
}

class imageSliderIndicators extends StatelessWidget {
  const imageSliderIndicators({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(builder: (controller) {
      return SizedBox(
          height: 10,
          child: ListView.builder(
              itemCount: controller.product.productImages!.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(right: 5, bottom: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: controller.imagesSliderIndicator == index
                          ? AppColors.primaryColor
                          : AppColors.black))));
    });
  }
}
