import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/checkout/checkout.dart';

class paymentMethods extends GetView<CheckoutController> {
  const paymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: controller.paymentMethods.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return paymentMethodCard(
                radioGroupName: controller.SelectedPaymentMethod,
                name: controller.paymentMethods[index]['name'],
                value: controller.paymentMethods[index]['value'],
                img: controller.paymentMethods[index]['img']);
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
        ),
      ],
    );
  }
}

class paymentMethodCard extends GetView<CheckoutController> {
  const paymentMethodCard(
      {super.key,
      required this.radioGroupName,
      required this.name,
      required this.value,
      required this.img});

  final String radioGroupName;
  final String name;
  final String value;
  final String img;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (controller) {
      return RadioListTile(
          title: Text(name, style: TextStyle(fontSize: 20)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.only(bottom: 10),
          subtitle: Row(
            children: [
              img.isEmpty
                  ? Text("PaymentWhenReciveTheOrder".tr)
                  : Image.asset(img, width: 70),
              SizedBox(width: 10),
              if (name == "Valu") Text("Installmentsupto60months".tr)
            ],
          ),
          value: value,
          selected: controller.SelectedPaymentMethod == value,
          groupValue: controller.SelectedPaymentMethod,
          // activeColor: Colors.blue,
          selectedTileColor: controller.SelectedTile,
          onChanged: (value) {
            controller.selectedpaymentMethod(value!, context);
          });
    });
  }
}
