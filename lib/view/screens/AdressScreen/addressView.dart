import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/core/functions/toast.dart';
import 'package:ecommerce/core/shared/HandleingRequsetData.dart';
import 'package:ecommerce/data/Model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/addressViewController.dart';

class AddressView extends GetView<AddressViewController> {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(title: const Text(' Your Address')),
      backgroundColor: Color.fromARGB(255, 237, 237, 237),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.addressList.length < 3) {
            Get.toNamed(AppRoutes.addressAdd);
          } else {
            toastAlert(
                msg: "you can't Add more than 3 Addresses",
                color: AppColors.primaryColor);
          }
        },
        backgroundColor: AppColors.secondryColor,
        child: Icon(Icons.add),
      ),
      body: GetBuilder<AddressViewController>(builder: (controller) {
        return HandleingRequsetData(
          statusRequest: controller.statusRequest!,
          widget: controller.addressList.isEmpty
              ? Center(
                  child: Text("You Don't Add Any Address yet",
                      style: TextStyle(fontSize: 20)))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.addressList.length,
                  itemBuilder: (context, index) => AddressCard(
                      addressDetails: controller.addressList[index]),
                ),
        );
      }),
    );
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
        subtitle: DefaultTextStyle(
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Street : ${addressDetails.street!}"),
              Text(
                  "Building Number : ${addressDetails.buildingNumber!.toString()}"),
              Text("Floor Number : ${addressDetails.floorNumber!.toString()}"),
              Text(
                  "Apartment Number : ${addressDetails.apartmentNumber!.toString()}"),
            ],
          ),
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
