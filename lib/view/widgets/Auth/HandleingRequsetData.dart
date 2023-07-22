import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/view/screens/auth/Authloading.dart';
import 'package:ecommerce/view/screens/auth/offlineAlert.dart';
import 'package:flutter/material.dart';

class HandleingRequsetData extends StatelessWidget {
  const HandleingRequsetData(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const AuthLoaing()
        : statusRequest == StatusRequest.offlineFailure
            ? const offlineAlert()
            : widget;
  }
}
