import 'package:race_shop/controller/search/searchController.dart';
import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/constants/AppColors.dart';
import 'package:race_shop/data/Model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchBarController());
    return GetBuilder<SearchBarController>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? SizedBox(
                height: 200,
                child: Center(
                    child: CircularProgressIndicator(
                        color: AppColors.secondryColor)))
            : controller.statusRequest == StatusRequest.failure
                ? Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Center(
                        child: Text(
                      "NoProductsWereFound".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.searchedProducts.length,
                    itemBuilder: (context, index) => SearchItemCard(
                        product: controller.searchedProducts[index],
                        index: index),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10)));
  }
}

class SearchItemCard extends GetView<SearchBarController> {
  const SearchItemCard({required this.product, required this.index, super.key});
  final productModel product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MaterialButton(
        onPressed: () {
          controller.goToProductDetails(product, index);
        },
        color: Colors.grey[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Image.network(product.productCoverImage, width: 100),
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
      ),
    );
  }
}
