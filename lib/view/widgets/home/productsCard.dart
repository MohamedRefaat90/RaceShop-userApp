import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/AppColors.dart';

class productsCard extends GetView<HomeControllerImp> {
  productsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        itemCount: (controller.offersProducts.length * 0.7).toInt(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () => controller.goToProductDetails(
              controller.offersProducts[index], index),
          child: Container(
            width: 250,
            height: 130,
            decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15)),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: CachedNetworkImage(
                    imageUrl:
                        controller.offersProducts[index].productCoverImage,
                    alignment: Alignment.centerRight,
                    // height: 30,
                    // width: 80,
                    // fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "${controller.offersProducts[index].productPrice} LE",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                            decorationStyle: TextDecorationStyle.wavy,
                            color: AppColors.white,
                            fontSize: 20),
                      ),
                    )),
                Positioned(
                    left: 20,
                    top: 20,
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "${controller.offersProducts[index].productPrice - (controller.offersProducts[index].productPrice * controller.offersProducts[index].productDiscount ~/ 100)} LE",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    )),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(controller.offersProducts[index].productName,
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
