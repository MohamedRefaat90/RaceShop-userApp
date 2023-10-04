import 'package:ecommerce/controller/address/addressViewController.dart';
import 'package:ecommerce/controller/checkout/checkout.dart';
import 'package:ecommerce/core/shared/HandleingRequsetData.dart';
import 'package:ecommerce/core/shared/customAppBar.dart';
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

    return Scaffold(
      appBar: customAppBar(context, "Checkout"),
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
                    Text("Choose Payment Method",
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
