import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/ordersController.dart';
import '../../../controller/ordersHistory/ordersHistoryController.dart';
import '../../../core/constants/AppColors.dart';
import '../../../core/constants/AppRoutes.dart';
import '../../../core/shared/BTN.dart';
import '../../../core/shared/Loading.dart';
import '../../../data/Model/OrderModel.dart';

class orderCompeletedCard extends StatelessWidget {
  const orderCompeletedCard(
      {super.key, required this.order, required this.index});
  final OrderModel order;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: GetBuilder<ordersHistoryController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Number : ${index + 1}",
                      style: TextStyle(fontSize: 20)),
                  Text("${Jiffy.parse(order.createdAt!).fromNow()}"),
                ],
              ),
              SizedBox(height: 10),
              Text('Payment Type : ${order.paymentMethod}'),
              SizedBox(height: 5),
              Text('Order Price : ${order.totalItemsPrice} LE'),
              SizedBox(height: 5),
              Text('Shipping Price : ${order.delevieryPrice} LE'),
              SizedBox(height: 5),
              if (order.coupon != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Coupon : ${order.coupon['name']}'),
                    SizedBox(height: 5),
                    if (order.coupon != null)
                      Text('Coupon Discount : ${order.coupon['discount']} %'),
                    SizedBox(height: 5),
                  ],
                ),
              Text('Shipping Time : With in ${order.delevieryTimeInDays} Days'),
              SizedBox(height: 5),
              Text("Order Status : ${order.status}"),
              SizedBox(height: 10),
              Divider(
                  thickness: 3,
                  indent: 50,
                  endIndent: 50,
                  color: AppColors.primaryColor),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Total Price : ${order.totalPrice} LE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Spacer(),
                  BTN(
                      widget: Text("Order Details"),
                      press: () {
                        Get.toNamed(AppRoutes.ordersDetails,
                            arguments: {"order": order});
                      },
                      padding: 12)
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
