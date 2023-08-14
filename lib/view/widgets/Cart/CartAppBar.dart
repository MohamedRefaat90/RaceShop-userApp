import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/AppColors.dart';

AppBar cartAppBar() {
  return AppBar(
    title: const Text('Cart',
        style: TextStyle(color: AppColors.black, fontSize: 27)),
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.white,
    leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.black,
        ),
        onPressed: () => Get.back()),
  );
}
