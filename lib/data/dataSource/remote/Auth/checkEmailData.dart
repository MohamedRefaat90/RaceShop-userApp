// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:race_shop/ApiLinks.dart';
import 'package:race_shop/core/class/DB_helper.dart';

class checkEmailData {
  DB_helper db_helper;
  checkEmailData(
    this.db_helper,
  );

  checkEmail(String email, String otp) async {
    var response = await db_helper
        .postData(ApiLinks.confirmEmail, {"email": email, "otp": otp});
    return response.fold((l) => l, (r) => r);
  }
}
