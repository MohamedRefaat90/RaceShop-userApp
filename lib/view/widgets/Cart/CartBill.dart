import 'package:flutter/material.dart';

import '../../../core/constants/AppColors.dart';
import '../../../core/shared/BTN.dart';

class CartBill extends StatelessWidget {
  const CartBill({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.grey[700], fontSize: 18),
      child: Container(
        height: 200,
        padding:
            EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20, bottom: 10),
        child: Column(
          children: [
            Row(children: [Text('Price'), Spacer(), Text('18000 LE')]),
            SizedBox(height: 10),
            Divider(
              thickness: 2,
              color: Colors.grey,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(height: 7),
            Row(children: [
              Text(
                'Tottal Price',
                style: TextStyle(color: AppColors.black),
              ),
              Spacer(),
              Text('18100 LE',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold)),
            ]),
            Spacer(),
            BTN(
              lable: "Place Order",
              press: () {},
              color: AppColors.secondryColor,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
