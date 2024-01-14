import 'package:race_shop/controller/address/addressViewController.dart';
import 'package:race_shop/controller/checkout/checkout.dart';
import 'package:race_shop/core/shared/HandleingRequsetData.dart';
import 'package:race_shop/core/shared/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/checkout/OrderBTN.dart';
import '../../widgets/checkout/paymentMethods.dart';
import '../../widgets/checkout/userAddress.dart';

class Checkout extends GetView<CheckoutController> {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    Get.put(AddressViewController());
    controller.isCheckout = true;
    return Scaffold(
      appBar: customAppBar(context, "CheckOut".tr),
      body: SafeArea(
        child:
            GetBuilder<AddressViewController>(builder: (AddressViewcontroller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: HandleingRequsetData(
              statusRequest: AddressViewcontroller.statusRequest!,
              widget: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("ChoosePaymentMethod".tr,
                        style: TextStyle(fontSize: 20)),
                    paymentMethods(),
                    userAddress(),
                    SizedBox(height: 20),
                    OrderBTN(),
                    SizedBox(height: 10)
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
