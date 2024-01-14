import 'package:race_shop/core/functions/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBar(BuildContext context, String lable) {
  return AppBar(
      title: Text(lable.tr,
          style: TextStyle(fontSize: screenWidth(context) * 0.085)),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0);
}
