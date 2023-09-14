import 'package:flutter/material.dart';

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
      child: SizedBox(
        width: 80,
        height: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: isActive ? AppColors.primaryColor : AppColors.white),
            Text(title,
                style: TextStyle(
                    color: isActive ? AppColors.primaryColor : AppColors.white))
          ],
        ),
      ),
    );
  }
}
