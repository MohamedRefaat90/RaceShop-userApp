import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/checkout/checkout.dart';

class CheckoutDetailsItems extends GetView<CheckoutController> {
  const CheckoutDetailsItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: controller.checkout.items!.length,
      itemBuilder: (context, index) => CheckoutDetailsItemsCard(
          productName: controller.checkout.items![index].productName!,
          productImage: controller.checkout.items![index].coverImage!,
          productColor:
              controller.checkout.items![index].selectedVariation!.color!,
          productPrice: controller.checkout.items![index].price!,
          productSize:
              controller.checkout.items![index].selectedVariation!.size!,
          discount: controller.checkout.items![index].discount!,
          quantity: controller.checkout.items![index].quantity!,
          index: index),
      separatorBuilder: (context, index) => SizedBox(height: 10),
    );
  }
}

class CheckoutDetailsItemsCard extends StatelessWidget {
  const CheckoutDetailsItemsCard(
      {super.key,
      required this.productName,
      required this.productColor,
      required this.productSize,
      required this.productPrice,
      required this.discount,
      required this.quantity,
      required this.productImage,
      required this.index});

  final String productName;
  final String productColor;
  final String productSize;
  final int productPrice;
  final String productImage;
  final int discount;
  final int quantity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (controller) {
      return Stack(
        children: [
          Card(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    orderDetails_Image(img: productImage),
                    SizedBox(width: 5),
                    orderDetails_Info(
                        name: productName,
                        price: productPrice,
                        Color: productColor,
                        Size: productSize,
                        discount: discount,
                        quantity: quantity),
                  ],
                ),
              )),
          if (controller.checkout.items![index].discount! > 0)
            Positioned(
                right: 20,
                top: 5,
                child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 23,
                    child: Text(
                      "${controller.checkout.items![index].discount} %",
                      style: TextStyle(color: AppColors.white),
                    )))
        ],
      );
    });
  }
}

class orderDetails_Info extends StatelessWidget {
  const orderDetails_Info(
      {super.key,
      required this.name,
      required this.price,
      required this.Color,
      required this.Size,
      required this.discount,
      required this.quantity});
  final String name;
  final int price;

  final String Color;
  final String Size;
  final int discount;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(name, style: TextStyle(fontSize: 16)),
          SizedBox(height: 10),
          Text('$price LE',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Color : $Color"),
            Text("Size : $Size"),
            Text("Quantity : $quantity")
          ])
        ]));
  }
}

class orderDetails_Image extends StatelessWidget {
  const orderDetails_Image({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 100, child: Image.network(img));
  }
}
