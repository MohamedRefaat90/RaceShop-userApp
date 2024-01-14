import 'package:race_shop/controller/address/addressAddController.dart';
import 'package:race_shop/controller/address/addressViewController.dart';
import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/shared/BTN.dart';
import 'package:race_shop/view/widgets/Address/DeliveryZoneSelector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/checkout/checkout.dart';
import '../../../core/constants/AppColors.dart';
import '../../../core/constants/AppRoutes.dart';
import '../../../core/shared/customField.dart';

class AddressDetailsDialog extends GetView<AddressAddController> {
  const AddressDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewController addressViewController =
        Get.put(AddressViewController());

    CheckoutController checkoutController = Get.put(CheckoutController());
    double spaceBetweenFileds = 15;
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: controller.opacity,
      child: Form(
        key: controller.formKey,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: 350,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 10),
          transform: Matrix4.translationValues(
              0, controller.isAddressDialogVisible, 0),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Transform.translate(
                offset: Offset(58, 0),
                child: Divider(
                    color: AppColors.secondryColor,
                    height: 5,
                    thickness: 3,
                    endIndent: 290),
              ),
              Center(
                child: Text("AddressDetials".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: AppColors.black)),
              ),
              Transform.translate(
                offset: Offset(-55, 0),
                child: Divider(
                    color: AppColors.secondryColor,
                    height: 5,
                    thickness: 3,
                    indent: 290),
              ),
              SizedBox(height: spaceBetweenFileds),
              customField(
                  textEditingController: controller.AddressName,
                  color: AppColors.black,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "notEmpty".tr;
                    }
                    return null;
                  },
                  lable: "AddressName".tr,
                  hint: "Home/Work".tr),
              SizedBox(height: spaceBetweenFileds),
              DeliveryZoneSelector(),
              SizedBox(height: spaceBetweenFileds),
              customField(
                  textEditingController: controller.Street,
                  color: AppColors.black,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "notEmpty".tr;
                    }
                    return null;
                  },
                  lable: "Street".tr),
              SizedBox(height: spaceBetweenFileds),
              customField(
                  textEditingController: controller.BuildingNum,
                  color: AppColors.black,
                  validator: (value) {
                    if (value!.isEmpty || !GetUtils.isNumericOnly(value)) {
                      return "EnterNumber".tr;
                    }
                    return null;
                  },
                  lable: "Building".tr),
              SizedBox(height: spaceBetweenFileds),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: customField(
                        textEditingController: controller.floorNum,
                        color: AppColors.black,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !GetUtils.isNumericOnly(value)) {
                            return "EnterNumber".tr;
                          }
                          return null;
                        },
                        lable: "Floor".tr),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: customField(
                          textEditingController: controller.ApartmentNum,
                          color: AppColors.black,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !GetUtils.isNumericOnly(value)) {
                              return "EnterNumber".tr;
                            }
                            return null;
                          },
                          lable: "Apartment".tr))
                ],
              ),
              SizedBox(height: spaceBetweenFileds),
              GetBuilder<AddressAddController>(builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: BTN(
                      widget: controller.statusRequest == StatusRequest.loading
                          ? SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                  color: AppColors.white),
                            )
                          : Text("Submit".tr,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                      width: 150,
                      color: AppColors.secondryColor,
                      press: () async {
                        if (controller.formKey.currentState!.validate()) {
                          await controller.addAddress();
                          if (checkoutController.isCheckout != null ||
                              checkoutController.isCheckout == true) {
                            Get.offAllNamed(AppRoutes.checkout);
                            addressViewController.getAllAddresses();
                            checkoutController.isCheckout = false;
                          } else {
                            // Get.offNamed(AppRoutes.addressView);
                            Get.back();

                            addressViewController.getAllAddresses();
                          }
                        }
                      }),
                );
              }),
              Transform.translate(
                  offset: Offset(0, 10),
                  child: IconButton(
                      onPressed: () => controller.CloseAddressDetailsDialog(),
                      icon: Icon(Icons.cancel_outlined,
                          color: Colors.red, size: 35))),
            ]),
          ),
        ),
      ),
    );
  }
}
