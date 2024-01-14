import 'package:race_shop/ApiLinks.dart';
import 'package:race_shop/core/class/DB_helper.dart';

class ForgetPasswordData {
  DB_helper db_helper;

  ForgetPasswordData(this.db_helper);

  forgetPasswordData(String email) async {
    var response =
        await db_helper.postData(ApiLinks.forgotPassword, {"email": email});

    return response.fold((l) => l, (r) => r);
  }
}
