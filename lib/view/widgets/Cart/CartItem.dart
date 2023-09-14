import 'package:ecommerce/controller/Cart/cartController.dart';
import 'package:ecommerce/data/Model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Quantity_Cart_Item.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product, required this.index});
  final productModel product;
  final int index;
  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              child: Row(
                children: [
                  Cart_Item_Image(img: product.productCoverImage),
                  Cart_Item_Info(
                      name: product.productName, price: product.productPrice),
                  Quantity_Cart_Item(
                      quantity: controller.cartInfo['items'][index]['quantity'],
                      product: controller.cartInfo['items'][index],
                      productID: controller.cartInfo['items'][index]['product'],
                      productCartID: controller.cartInfo['items'][index]['_id'])
                ],
              )));
    });
  }
}

class Cart_Item_Info extends StatelessWidget {
  const Cart_Item_Info({super.key, required this.name, required this.price});
  final String name;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(name, style: TextStyle(fontSize: 16)),
          SizedBox(height: 10),
          Text('$price LE',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
        ]));
  }
}

class Cart_Item_Image extends GetView<CartControllerImp> {
  const Cart_Item_Image({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.network(img));
  }
}
