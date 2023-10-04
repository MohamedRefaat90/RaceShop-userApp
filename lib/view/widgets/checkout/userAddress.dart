import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/data/Model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/addressViewController.dart';
import '../../../controller/checkout/checkout.dart';
import '../../../core/constants/AppColors.dart';
import 'userAddressCard.dart';

class userAddress extends GetView<AddressViewController> {
  const userAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Address",
              style: TextStyle(fontSize: 20),
            ),
            if (controller.addressList.length < 3)
              TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.addressView);
                  },
                  child: Text("Add"))
          ],
        ),
        SizedBox(height: 10),
        controller.addressList.isEmpty
            ? Center(
                child: Text("You Not Add Any Address Yet",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)))
            : ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.addressList.length,
                itemBuilder: (context, index) {
                  return userAddressCard(
                      addressInfo: controller.addressList[index]);
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
              ),
      ],
    );
  }
}
