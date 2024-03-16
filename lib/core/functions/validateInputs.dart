import 'package:get/get.dart';

ValidateInputs(String value, String type, int min, int max) {
  if (value.isEmpty) {
    return "notEmpty".tr;
    // "الحقل لت يجب ان يكون فارغا"
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(value)) {
      return "emailnotValid".tr;
      // "الايميل غير صالح"
    }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(value)) {
      return "phonenotValid".tr;
      // "رقم الهاتف غير صالح"
    }
  }
  if (value.length < min) {
    return type == "username"
        ? "nameless5".tr
        : type == "email"
            ? "emailless5".tr
            : type == "phone"
                ? "phoneless11".tr
                : "passless8".tr;
  }
  if (value.length > max) {
    return type == "username"
        ? "namelarge30".tr
        : type == "email"
            ? "emaillarge30".tr
            : type == "phone"
                ? "phonelarge13".tr
                : "passlarge30".tr;
  }

  if (type == "password") {
    bool hasUppercase = value.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = value.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = value.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase || !hasDigits || !hasLowercase || !hasSpecialCharacters) {
      return "passReq".tr;
    }
  }
}

PasswordConfirmation(String password, String confirmPassword) {
  if (password != confirmPassword) {
    return "passNotMatch".tr;
  }
}
