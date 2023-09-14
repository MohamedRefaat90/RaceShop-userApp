import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/data/Model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Cart/cartController.dart';
import '../productDetails/QuantityBTN.dart';
import '../productDetails/QuantityNumber.dart';

class Quantity_Cart_Item extends StatelessWidget {
  const Quantity_Cart_Item(
      {super.key,
      required this.quantity,
      required this.productCartID,
      required this.productID,
      required this.product});
  final int quantity;
  final String productCartID;
  final String productID;
  final Map product;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [
                QuantityBTN(
                    icon: Icons.add,
                    press: () async {
                      controller.statusRequest = StatusRequest.none;
                      controller.update();
                      await controller.addToCart(
                          productID: productID,
                          productName: product['productName'],
                          productDecs: product['productDescription'],
                          quantity: 1,
                          color: product['selectedVariation']['color'],
                          size: product['selectedVariation']['size']);
                      await controller.updateCart();
                      controller.upProductQuantity();
                    }),
                controller.statusRequest == StatusRequest.none
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor, strokeWidth: 3),
                      )
                    : QuantityNumber(count: quantity),
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: QuantityBTN(
                        icon: Icons.minimize,
                        press: () async {
                          if (product['quantity'] > 1) {
                            controller.statusRequest = StatusRequest.none;
                            controller.update();
                            await controller.removeOneFromCart(productCartID);
                            await controller.updateCart();
                            controller.downProductQuantity();
                          }
                        }))
              ]),
              SizedBox(
                  width: 30,
                  child: IconButton(
                      onPressed: () {
                        controller.removeFromCart(productCartID, productID);
                        print(productCartID);
                      },
                      icon: Icon(Icons.delete, color: Colors.red, size: 30),
                      padding: EdgeInsets.zero))
            ],
          ));
    });
  }
}
