// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/ApiLinks.dart';
import 'package:ecommerce/core/class/DB_helper.dart';

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
    var response = await db_helper.postData(ApiLinks.signup, {
      "Fname": firstName,
      "Lame": lastName,
      "email": email,
      "password": password,
      "passwordConfirm": passwordConfirm,
      "phone": phone,
    });

    return response.fold((l) => l, (r) => r);
  }
}
