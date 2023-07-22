import 'package:another_flushbar/flushbar.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:flutter/material.dart';

flushBar(BuildContext context,
    {String? message, required StatusRequest status}) {
  Flushbar(
    // title: status == StatusRequest.offlineFailure
    //     ? "No internet"
    //     : status == StatusRequest.success
    //         ? "Check Your Email"
    //         : status == StatusRequest.failure
    //             ? "Email Already Exist"
    //             : "Somthing Wrong",
    titleSize: 18,
    backgroundColor: status == StatusRequest.success
        ? Colors.green
        : status == StatusRequest.offlineFailure
            ? Colors.black87
            : Colors.red,
    message: status == StatusRequest.offlineFailure
        ? "You Are not Conneted To Internet"
        : message ?? status.toString(),
    messageSize: 16,
    duration: const Duration(seconds: 4),
  ).show(context);
}
