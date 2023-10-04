import 'package:ecommerce/controller/address/addressAddController.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/shared/BTN.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/checkout/checkout.dart';
import '../../widgets/Address/AddressDetailsDialog.dart';
import '../../widgets/Address/OSmap.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressAddController());

    return Scaffold(
      body: GetBuilder<AddressAddController>(builder: (controller) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            OSmap(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: controller.mapIsReady
                  ? BTN(
                      widget: Text("Pick",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.white)),
                      color: AppColors.primaryColor,
                      width: 150,
                      padding: 15,
                      press: () async {
                        await controller.OpenAddressDetailsDialog(context);
                        // BarrierAroundManager.showBarrier(controller.barrierKey);
                        controller.update();
                      })
                  : SizedBox(),
            ),
            if (controller.isAddressDialogActive == true)
              ModalBarrier(
                  color: AppColors.black.withOpacity(0.5), dismissible: false),
            AddressDetailsDialog(),
          ],
        );
      }),
    );
  }
}
