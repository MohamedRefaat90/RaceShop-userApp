import 'package:race_shop/core/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/LanguageController/LanguageController.dart';

class customField extends StatelessWidget {
  const customField(
      {super.key,
      required this.lable,
      this.icon,
      this.hint,
      this.textEditingController,
      this.isPass = false,
      this.isPhone = false,
      this.iconPress,
      this.validator,
      this.color});
  final String lable;
  final String? hint;
  final IconData? icon;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final Function()? iconPress;
  final Color? color;
  final bool isPass;
  final bool isPhone;
  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.find();
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      obscureText: isPass,
      keyboardType: isPhone
          ? const TextInputType.numberWithOptions(decimal: false)
          : TextInputType.text,
      style: TextStyle(
          color: color == null
              ? languageController.themeMode == ThemeMode.dark
                  ? AppColors.white
                  : AppColors.black
              : color),
      decoration: InputDecoration(
          label: Text(lable),
          labelStyle: const TextStyle(color: AppColors.primaryColor),
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          suffixIconColor: AppColors.primaryColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2,
                  color: languageController.themeMode == ThemeMode.dark
                      ? AppColors.white
                      : AppColors.black),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          suffixIcon: IconButton(icon: Icon(icon), onPressed: iconPress)),
    );
  }
}
