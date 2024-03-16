import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:race_shop/controller/Favourite/FavouriteController.dart';
import 'package:race_shop/core/functions/translate.dart';
import 'package:race_shop/data/Model/productModel.dart';

class FavouriteProductCard extends GetView<FavouriteControllerImp> {
  final productModel product;

  final int index;
  const FavouriteProductCard(
      {super.key, required this.product, required this.index});
  @override
  Widget build(BuildContext context) {
    Get.put(FavouriteControllerImp());
    return InkWell(
      onTap: () => controller.goToProductDetails(product),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
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
                        fontWeight: FontWeight.bold, fontSize: 17)),
              ),
              GetBuilder<FavouriteControllerImp>(builder: (context) {
                return Row(
                  children: [
                    Text(
                      "    ${product.productPrice} LE",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          controller.setIsFav(product.productID, false);
                          controller.productRemoveFromFav(product.productID,
                              index: index);
                        },
                        icon: Icon(Icons.delete_outline_outlined,
                            color: Colors.red))
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
