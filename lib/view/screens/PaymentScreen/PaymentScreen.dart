import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../controller/payment/paymentController.dart';

class PaymentScreen extends GetView<paymantController> {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(paymantController());
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Payment'),
      // ),
      body: WebViewWidget(controller: controller.webViewController),
    );
  }
}
