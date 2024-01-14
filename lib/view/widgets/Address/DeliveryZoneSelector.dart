import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:race_shop/core/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/addressAddController.dart';

class DeliveryZoneSelector extends GetView<AddressAddController> {
  const DeliveryZoneSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressAddController>(builder: (controller) {
      return DropdownButtonHideUnderline(
        child: DropdownButton2<dynamic>(
          iconStyleData: IconStyleData(
              icon: Icon(Icons.arrow_drop_down_circle, color: Colors.grey)),
          isExpanded: true,
          hint: Text('Select City',
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          items: controller.deliveryZoneList
              .map((item) => DropdownMenuItem<dynamic>(
                    value: item,
                    child: Text(item["zoneName_en"],
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.black)),
                  ))
              .toList(),
          value: controller.deliveryZone,
          onChanged: (dynamic value) {
            controller.getDeliveryZoneID(value!);
          },
          buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.symmetric(
                    vertical: BorderSide(width: 1, color: Colors.grey),
                    horizontal: BorderSide(width: 1, color: Colors.grey)),
              )),
          menuItemStyleData: const MenuItemStyleData(height: 40),
        ),
      );
    });
  }
}
