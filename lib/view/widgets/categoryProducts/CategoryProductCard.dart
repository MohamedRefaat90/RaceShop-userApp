import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/Favourite/FavouriteController.dart';
import 'package:ecommerce/core/functions/translate.dart';
import 'package:ecommerce/data/Model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/CategoryProducts/CategoryProductsController.dart';
import '../../../core/constants/AppColors.dart';

class CategoryProductCard extends GetView<CategoryProductsControllerImp> {
  const CategoryProductCard(
      {super.key, required this.index, required this.product});

  final productModel product;
  final int index;
  @override
  Widget build(BuildContext context) {
    Get.put(CategoryProductsControllerImp());
    FavouriteControllerImp FavController = Get.put(FavouriteControllerImp());

    return InkWell(
      onTap: () => controller.goToProductDetails(product, index),
      child: Stack(
        children: [
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: CachedNetworkImage(
                    imageUrl: product.productCoverImage,
                    errorWidget: (context, url, error) =>
                        const Center(child: CircularProgressIndicator()),
                    alignment: Alignment.center,
                    height: 120,
                  )),
                  Center(
                    child: Text(
                        translate(product.productName, product.productNameAr),
                        style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                  ),
                  GetBuilder<FavouriteControllerImp>(builder: (context) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Text("${product.productPrice} LE",
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 16,
                                      decoration: product.productDiscount > 0
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none)),
                              if (product.productDiscount > 0)
                                Shimmer.fromColors(
                                  baseColor: AppColors.primaryColor,
                                  highlightColor:
                                      const Color.fromARGB(255, 233, 0, 0),
                                  child: Text(
                                    "${product.productPrice - (product.productPrice * product.productDiscount ~/ 100).toInt()} LE",
                                    style: TextStyle(
                                        color: product.productDiscount > 0
                                            ? AppColors.secondryColor
                                            : AppColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              if (FavController
                                      .productsFav[product.productID] ==
                                  true) {
                                FavController.setIsFav(
                                    product.productID, false);
                                FavController.productRemoveFromFav(
                                    product.productID,
                                    index: index);
                                ;
                              } else {
                                FavController.setIsFav(product.productID, true);
                                FavController.productAddtoFav(
                                    product.productID);
                              }
                            },
                            icon: Icon(
                                FavController.productsFav[product.productID] ==
                                        true
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: Colors.red))
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          if (product.productDiscount > 0)
            Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 25,
                  child: Text(
                    "${product.productDiscount} %",
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ))
        ],
      ),
    );
  }
}
