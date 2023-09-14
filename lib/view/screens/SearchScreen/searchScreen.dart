import 'package:ecommerce/controller/search/searchController.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/data/Model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchBarController());
    return GetBuilder<SearchBarController>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loading
                ? SizedBox(
                    height: 200,
                    child: Center(
                        child: CircularProgressIndicator(
                            color: AppColors.secondryColor)))
                : controller.statusRequest == StatusRequest.failure
                    ? Text("No Products Were Found")
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.searchedProducts.length,
                        itemBuilder: (context, index) => SearchItemCard(
                            product: controller.searchedProducts[index],
                            index: index),
                      ));
  }
}

class SearchItemCard extends GetView<SearchBarController> {
  const SearchItemCard({required this.product, required this.index, super.key});
  final productModel product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.goToProductDetails(product, index);
      },
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.network(
            product.productCoverImage,
            width: 100,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.productName),
              SizedBox(height: 10),
              Text("${product.productPrice} LE"),
            ],
          )
        ],
      ),
    );
  }
}
