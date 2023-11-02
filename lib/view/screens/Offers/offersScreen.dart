import 'package:ecommerce/core/shared/customAppBar.dart';
import 'package:flutter/material.dart';
import '../../widgets/Offers/OffersProducts.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(OffersController());
    return Scaffold(
      appBar: customAppBar(context, "Offers"),
      body: ListView(
          // controller: controller.scrollController,
          shrinkWrap: true,
          children: [
            OffersProducts(),
            // (controller.loading == true &&
            //         controller.statusRequest != StatusRequest.none)
            //     ? SizedBox(
            //         height: 60,
            //         child: Center(
            //             child: CircularProgressIndicator(
            //                 color: AppColors.primaryColor)))
            // controller.statusRequest == StatusRequest.none
            // ? Padding(
            //     padding: EdgeInsets.symmetric(vertical: 10),
            //     child: Center(
            //         child: Text("No More Products",
            //             style:
            //                 TextStyle(fontWeight: FontWeight.bold))))
            // : SizedBox()
          ]),
    );
  }
}
