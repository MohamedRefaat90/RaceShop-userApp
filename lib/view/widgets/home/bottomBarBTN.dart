import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:race_shop/core/class/responsive.dart';

import '../../../core/constants/AppColors.dart';

class bottomBarBTN extends StatelessWidget {
  const bottomBarBTN(
      {super.key,
      required this.title,
      required this.icon,
      required this.press,
      required this.isActive});
  final void Function()? press;
  final String title;
  final IconData icon;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        width: Responsive.getSize(context).width * 0.19,
        height: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: isActive ? AppColors.primaryColor : AppColors.white,
                size: Responsive.getSize(context).width * 0.060),
            Text(title.tr,
                style: TextStyle(
                    color: isActive ? AppColors.primaryColor : AppColors.white,
                    fontSize: Responsive.getSize(context).width * 0.030))
          ],
        ),
      ),
    );
  }
}
