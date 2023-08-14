import 'package:flutter/material.dart';

import 'Quantity_Cart_Item.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          child: Row(
            children: [
              Cart_Item_Image(),
              Cart_Item_Info(),
              Quantity_Cart_Item()
            ],
          )),
    );
  }
}

class Cart_Item_Info extends StatelessWidget {
  const Cart_Item_Info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text('name', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text('3000 LE',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
        ]));
  }
}

class Cart_Item_Image extends StatelessWidget {
  const Cart_Item_Image({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('assets/images/products/1.png'));
  }
}
