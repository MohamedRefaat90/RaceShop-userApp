import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constants/AppAssets.dart';
import 'package:ecommerce/core/functions/handelDataController.dart';
import 'package:ecommerce/core/services/myServices.dart';
import 'package:ecommerce/data/Model/checkoutModel.dart';
import 'package:ecommerce/data/dataSource/remote/checkout/checkoutData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  List<Map> paymentMethods = [
    {"name": "Credit Card", "value": "card", "img": AppAssets.visa},
    {"name": "Vodafone Cash", "value": "wallet", "img": AppAssets.vodaCash},
    {"name": "Fawry", "value": "kiosk", "img": AppAssets.fawry},
    {"name": "Valu", "value": "valu", "img": AppAssets.valu},
    {"name": "Cash", "value": "cash", "img": ""}
  ];
  StatusRequest? statusRequest;
  CheckoutData checkoutData = CheckoutData(Get.find());
  Color SelectedTile = Colors.black.withOpacity(0.8);
  String SelectedPaymentMethod = "";
  String? SelectedAddress;
  bool? isCheckout;
  Map? deliveryZone;
  bool isPaymentOnlineOpen = true;
  MyServices myServices = Get.find();
  String? userToken;

  late checkoutModel checkout;

  @override
  void onInit() {
    isCheckout = true;
    userToken = myServices.sharedPreferences.getString('userToken');
    super.onInit();
  }

  selectedpaymentMethod(String val) {
    SelectedPaymentMethod = val;
    update();
  }

  selectedAddress(String? val) {
    SelectedAddress = val;
    print(SelectedAddress);
    update();
  }

  checkoutCash(String? couponName) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await checkoutData.makeCheckoutCash(
        AddressID: SelectedAddress!,
        DelevieryZoneId: deliveryZone!['_id'],
        couponName: couponName,
        userToken: userToken!);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        checkout = checkoutModel.fromJson(response['data']['data']);
      }
    }
    update();
    print(checkout.paymentMethod);
  }

  checkoutOnline(String? couponName) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await checkoutData.makeCheckoutOnline(
        AddressID: SelectedAddress!,
        DelevieryZoneId: deliveryZone!['_id'],
        couponName: couponName!,
        paymentMethodType: SelectedPaymentMethod,
        userToken: userToken!);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        checkout = checkoutModel.fromJson(response['data']['data']);
      }
    }
    update();
    print(checkout.paymentMethod);
  }
}
