import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/data/Model/userModel.dart';
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
              "DeliveryAddress".tr,
              style: TextStyle(fontSize: 20),
            ),
            if (controller.addressList.length < 3)
              TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.addressView);
                  },
                  child: Text("Add".tr))
          ],
        ),
        SizedBox(height: 10),
        controller.addressList.isEmpty
            ? Center(
                child: Text("YouNotAddAnyAddressYet".tr,
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
