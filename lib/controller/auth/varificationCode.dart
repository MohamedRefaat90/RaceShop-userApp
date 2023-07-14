import 'package:get/get.dart';

import '../../core/constants/AppRoutes.dart';

abstract class varificationController extends GetxController {
  varify();
  goToResetPassword();
}

class varificationControllerImp extends varificationController {
  @override
  goToResetPassword() {
    Get.toNamed(AppRoutes.restPassword);
  }

  @override
  varify() {
    // TODO: implement varify
  }
}
