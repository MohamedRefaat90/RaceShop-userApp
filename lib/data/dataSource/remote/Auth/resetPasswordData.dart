import 'package:race_shop/ApiLinks.dart';
import 'package:race_shop/core/class/DB_helper.dart';

class ResetPasswordData {
  DB_helper db_helper;
  ResetPasswordData(this.db_helper);

  resetPassword(
      {required String email,
      required String password,
      required String passwordConfirm,
      required String otp}) async {
    var response = await db_helper.patchData(ApiLinks.resetPassword, {
      "email": email,
      "password": password,
      "passwordConfirm": passwordConfirm,
      "otp": otp,
    });

    return response.fold((l) => l, (r) => r);
  }
}
