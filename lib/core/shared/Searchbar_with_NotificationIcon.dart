import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/AppColors.dart';

class Searchbar_with_NotificationIcon extends StatelessWidget {
  const Searchbar_with_NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0)
                .copyWith(left: 3, right: 0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "findProduct".tr,
                  prefixIcon: const Icon(Icons.search),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: AppColors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
        ),
        IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.notifications_outlined,
              size: 35,
              color: AppColors.primaryColor,
            ))
      ],
    );
  }
}
