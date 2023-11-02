import 'package:ecommerce/controller/orders/ordersController.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/shared/HandleingRequsetData.dart';
import 'package:ecommerce/core/shared/customAppBar.dart';
import 'package:ecommerce/data/Model/OrderModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/class/statusRequest.dart';
import '../../../core/shared/Loading.dart';
import '../../widgets/Orders/OrderCard.dart';

class OrdersScreen extends GetView<ordersController> {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ordersController());

    return Scaffold(
      appBar: customAppBar(context, "Orders"),
      backgroundColor: AppColors.white.withOpacity(0.9),
      body: GetBuilder<ordersController>(builder: (controller) {
        return HandleingRequsetData(
            statusRequest: controller.statusRequest,
            widget: ListView(
              controller: controller.scrollController,
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.orders.length,
                    itemBuilder: (context, index) => controller.statusRequest ==
                            StatusRequest.none
                        ? Loading()
                        : orderCard(
                            order:
                                OrderModel.fromJson(controller.orders[index]),
                            index: index)),
                if (controller.loading == true)
                  SizedBox(
                      height: 60,
                      child: Center(
                          child: CircularProgressIndicator(
                              color: AppColors.primaryColor)))
              ],
            ));
      }),
    );
  }
}
