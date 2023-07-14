import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:flutter/material.dart';

class BTN extends StatelessWidget {
  const BTN(
      {super.key,
      required this.lable,
      required this.press,
      this.color,
      this.padding,
      this.width});
  final String lable;
  final void Function()? press;
  final Color? color;
  final double? padding;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      padding: EdgeInsets.all(padding ?? 20),
      minWidth: width ?? 50,
      textColor: Colors.white,
      color: color ?? AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        lable,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
