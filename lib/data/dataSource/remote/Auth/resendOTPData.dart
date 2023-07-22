import 'package:ecommerce/core/class/DB_helper.dart';

import '../../../../ApiLinks.dart';

class ResendOTPData {
  DB_helper db_helper;

  ResendOTPData(this.db_helper);

  resendOTP(String email) async {
    var response =
        await db_helper.postData(ApiLinks.resendOtp, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
