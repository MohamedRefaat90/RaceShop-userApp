import 'package:get/get.dart';

abstract class CartController extends GetxController {
  upProductQuantity();
  downProductQuantity();
}

class CartControllerImp extends CartController {
  int productQuantity = 1;
  @override
  upProductQuantity() {
    productQuantity++;
    update();
  }

  @override
  downProductQuantity() {
    if (productQuantity > 1) {
      productQuantity--;
      update();
    }
  }
}
