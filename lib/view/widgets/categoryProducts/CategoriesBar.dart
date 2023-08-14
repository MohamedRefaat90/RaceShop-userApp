import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/CategoryProductsController.dart';
import '../../../core/constants/AppColors.dart';
import '../../../core/functions/translate.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryProductsControllerImp>(builder: (controller) {
      return SizedBox(
        height: 50,
        child: ListView.builder(
          itemCount: controller.categoriesList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => MaterialButton(
            onPressed: () {
              controller.selectedCat = index;

              controller.getCategoryProducts(
                  categoryID: controller.categoriesList[index].categoryID);
            },
            splashColor: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  translate(controller.categoriesList[index].categoryName!,
                      controller.categoriesList[index].categoryNameAr!),
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.deepGray,
                      fontFamily: "cairo"),
                ),
                controller.selectedCat == index
                    ? Container(
                        margin: const EdgeInsets.only(top: 3),
                        height: 3,
                        width: 25,
                        color: AppColors.secondryColor)
                    : const SizedBox()
              ],
            ),
          ),
        ),
      );
    });
  }
}
