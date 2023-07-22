import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:flutter/material.dart';

class customField extends StatelessWidget {
  const customField({
    super.key,
    required this.lable,
    required this.icon,
    required this.hint,
    this.textEditingController,
    this.isPass = false,
    this.isPhone = false,
    this.iconPress,
    required this.validator,
  });
  final String lable;
  final String hint;
  final IconData icon;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final Function()? iconPress;
  final bool isPass;
  final bool isPhone;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      obscureText: isPass,
      keyboardType: isPhone
          ? const TextInputType.numberWithOptions(decimal: false)
          : TextInputType.text,
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
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          suffixIcon: IconButton(icon: Icon(icon), onPressed: iconPress)),
    );
  }
}
