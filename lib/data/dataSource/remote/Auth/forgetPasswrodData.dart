import 'package:ecommerce/ApiLinks.dart';
import 'package:ecommerce/core/class/DB_helper.dart';

class ForgetPasswordData {
  DB_helper db_helper;

  ForgetPasswordData(this.db_helper);

  forgetPasswordData(String email) async {
    var response =
        await db_helper.postData(ApiLinks.forgotPassword, {"email": email});

    return response.fold((l) => l, (r) => r);
  }
}
