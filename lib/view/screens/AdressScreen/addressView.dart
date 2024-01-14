import 'package:race_shop/core/constants/AppColors.dart';
import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/core/functions/toast.dart';
import 'package:race_shop/core/shared/HandleingRequsetData.dart';
import 'package:race_shop/data/Model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/addressViewController.dart';

class AddressView extends GetView<AddressViewController> {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return GetBuilder<AddressViewController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: Text('Address'.tr)),
        // backgroundColor: Color.fromARGB(255, 237, 237, 237),
        floatingActionButton: controller.addressList.length < 3
            ? FloatingActionButton(
                heroTag: 'AddressView',
                onPressed: () {
                  if (controller.addressList.length < 3) {
                    Get.toNamed(AppRoutes.addressAdd);
                  } else {
                    toastAlert(
                        msg: "youcan'tAddmorethan3Addresses".tr,
                        color: AppColors.primaryColor);
                  }
                },
                backgroundColor: AppColors.secondryColor,
                child: Icon(Icons.add),
              )
            : null,
        body: HandleingRequsetData(
          statusRequest: controller.statusRequest!,
          widget: controller.addressList.isEmpty
              ? Center(
                  child: Text("YouDon'tAddAnyAddressyet".tr,
                      style: TextStyle(fontSize: 20)))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.addressList.length,
                  itemBuilder: (context, index) => AddressCard(
                      addressDetails: controller.addressList[index]),
                ),
        ),
      );
    });
  }
}

class AddressCard extends GetView<AddressViewController> {
  const AddressCard({super.key, required this.addressDetails});

  final AddressModel addressDetails;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        title: Text(addressDetails.name!, style: TextStyle(fontSize: 20)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(text: "Street:".tr),
              TextSpan(text: addressDetails.street!),
            ])),
            Text.rich(TextSpan(children: [
              TextSpan(text: "Building:".tr),
              TextSpan(text: addressDetails.buildingNumber!.toString()),
            ])),
            Text.rich(TextSpan(children: [
              TextSpan(text: "Floor:".tr),
              TextSpan(text: addressDetails.floorNumber!.toString()),
            ])),
            Text.rich(TextSpan(children: [
              TextSpan(text: "Apartment:".tr),
              TextSpan(text: addressDetails.apartmentNumber!.toString()),
            ])),
          ],
        ),
        trailing: IconButton(
            onPressed: () {
              controller.removeAddress(addressDetails.Id!);
            },
            icon: Icon(Icons.delete, color: Colors.red, size: 30)),
      ),
    );
  }
}
