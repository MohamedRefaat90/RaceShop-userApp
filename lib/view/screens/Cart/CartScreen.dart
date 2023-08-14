import 'package:ecommerce/controller/Cart/cartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/Cart/CartAppBar.dart';
import '../../widgets/Cart/CartBill.dart';
import '../../widgets/Cart/CartItem.dart';
import '../../widgets/Cart/CartTitle.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
      appBar: cartAppBar(),
      bottomNavigationBar: CartBill(),
      body: ListView(children: [
        CartTitle(),
        SizedBox(height: 10),
        CartItem(),
        CartItem(),
        CartItem(),
        CartItem(),
      ]),
    );
  }
}
