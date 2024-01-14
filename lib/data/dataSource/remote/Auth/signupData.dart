// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:race_shop/ApiLinks.dart';
import 'package:race_shop/core/class/DB_helper.dart';

class SignupData {
  DB_helper db_helper;

  SignupData(this.db_helper);

  postSignupData(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String passwordConfirm,
      required String phone}) async {
    Map data = {
      "firstName": firstName.trim(),
      "lastName": lastName.trim(),
      "email": email.trim(),
      "password": password.trim(),
      "passwordConfirm": passwordConfirm.trim(),
      "phone": phone.trim()
    };

    var response = await db_helper.postData(ApiLinks.signup, data);

    return response.fold((l) => l, (r) => r);
  }
}
