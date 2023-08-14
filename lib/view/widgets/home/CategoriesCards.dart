// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:ecommerce/controller/home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce/data/Model/CategoriesModel.dart';

import '../../../core/constants/AppColors.dart';
import '../../../core/functions/translate.dart';

class CategoriesCards extends GetView<HomeControllerImp> {
  const CategoriesCards({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return SizedBox(
      height: 100,
      child: GetBuilder<HomeControllerImp>(builder: (controller) {
        return ListView.separated(
          itemCount: controller.categoriesList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => Category(
              selectedCategory: index,
              category: controller.categoriesList[index]
              // CategoriesModel.fromJson(controller.categoriesList[index]),
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
        );
      }),
    );
  }
}

class Category extends GetView<HomeControllerImp> {
  const Category({
    super.key,
    required this.category,
    required this.selectedCategory,
  });
  final CategoriesModel category;
  final int selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
            onPressed: () {
              controller.goToCategoryProducts(selectedCategory);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: AppColors.primaryColor,
            minWidth: 75,
            height: 65,
            splashColor: AppColors.secondryColor,
            child: CachedNetworkSVGImage(category.categoryImage!,
                height: 50, color: AppColors.white)),
        const SizedBox(height: 5),
        Text(
          translate(category.categoryName!, category.categoryNameAr!),
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "cairo"),
        ),
      ],
    );
  }
}
