import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/shared/Loading.dart';
import 'package:race_shop/core/shared/noData.dart';
import 'package:race_shop/core/shared/offlineAlert.dart';

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
        ? const Loading()
        : statusRequest == StatusRequest.offlineFailure
            ? const offlineAlert()
            : statusRequest == StatusRequest.failure
                ? const noData()
                : widget;
  }
}
