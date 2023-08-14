import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Cart/cartController.dart';
import '../productDetails/QuantityBTN.dart';
import '../productDetails/QuantityNumber.dart';

class Quantity_Cart_Item extends StatelessWidget {
  const Quantity_Cart_Item({
    super.key,
  });

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
                    press: () => controller.upProductQuantity()),
                QuantityNumber(count: controller.productQuantity),
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: QuantityBTN(
                        icon: Icons.minimize,
                        press: () => controller.downProductQuantity()))
              ]),
              SizedBox(
                width: 30,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                    padding: EdgeInsets.zero),
              )
            ],
          ));
    });
  }
}
