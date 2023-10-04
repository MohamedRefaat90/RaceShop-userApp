import 'package:ecommerce/controller/address/addressAddController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/checkout/checkout.dart';
import '../../../core/constants/AppColors.dart';
import '../../../data/Model/userModel.dart';

class userAddressCard extends GetView<CheckoutController> {
  const userAddressCard({super.key, required this.addressInfo});
  final AddressModel addressInfo;
  @override
  Widget build(BuildContext context) {
    AddressAddController addressAddController = Get.put(AddressAddController());
    return GetBuilder<CheckoutController>(builder: (context) {
      return DefaultTextStyle(
        style: TextStyle(color: AppColors.white),
        child: RadioListTile.adaptive(
          value: addressInfo.Id,
          groupValue: controller.SelectedAddress,
          onChanged: (val) {
            controller.selectedAddress(val);
            controller.deliveryZone = addressAddController.deliveryZoneList
                .firstWhere((e) => e['zoneName_en'] == addressInfo.city);
          },
          selected: controller.SelectedAddress == addressInfo.Id,
          selectedTileColor: controller.SelectedTile,
          title: Text(
            addressInfo.name!,
            style: TextStyle(
                fontSize: 18,
                color: controller.SelectedAddress == addressInfo.Id
                    ? AppColors.white
                    : AppColors.black),
          ),
          subtitle: DefaultTextStyle(
            style: TextStyle(
                color: controller.SelectedAddress == addressInfo.Id
                    ? AppColors.white
                    : AppColors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("City : ${addressInfo.city!}"),
                SizedBox(height: 5),
                Text("Street : ${addressInfo.street!}"),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Building : ${addressInfo.buildingNumber}"),
                    Text("Floor : ${addressInfo.floorNumber}"),
                    Text("Apartment : ${addressInfo.apartmentNumber}"),
                  ],
                ),
                SizedBox(height: 5)
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 2, color: AppColors.black)),
        ),
      );
    });
  }
}
