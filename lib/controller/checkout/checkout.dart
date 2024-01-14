import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/constants/AppAssets.dart';
import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/core/shared/BTN.dart';
import 'package:race_shop/core/shared/customField.dart';
import 'package:race_shop/data/Model/checkoutModel.dart';
import 'package:race_shop/data/dataSource/remote/checkout/checkoutData.dart';
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
  int totalItemsDiscount = 0;
  late TextEditingController mobileWallet;
  late checkoutModel checkout;
  late String onlinePaymentURL;

  @override
  void onInit() {
    userToken = myServices.sharedPreferences.getString('userToken');
    mobileWallet = TextEditingController();
    super.onInit();
  }

  selectedpaymentMethod(String val, BuildContext context) {
    SelectedPaymentMethod = val;

    if (val == "wallet") {
      Get.defaultDialog(
          title: "EnterVodaCash".tr,
          titleStyle: TextStyle(fontSize: 20),
          titlePadding: EdgeInsets.all(20),
          contentPadding: EdgeInsets.all(20),
          content: Container(
              height: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  customField(
                      lable: "Mobile Number",
                      hint: "ex : 01010101010",
                      textEditingController: mobileWallet),
                  Spacer(),
                  BTN(
                      widget: Text("Submit".tr),
                      press: () {
                        Get.back();
                      },
                      width: 200)
                ],
              )));
    }
    update();
  }

  selectedAddress(String? val) {
    SelectedAddress = val;
    update();
  }

  checkoutCash(String? couponName, BuildContext context) async {
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
        Get.toNamed(AppRoutes.checkoutDetails);
      }
    }
    update();
  }

  checkoutOnline(String? couponName) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await checkoutData.makeCheckoutOnline(
        AddressID: SelectedAddress!,
        DelevieryZoneId: deliveryZone!['_id'],
        couponName: couponName!,
        mobileWallet: "01010101010",
        paymentMethodType: SelectedPaymentMethod,
        userToken: userToken!);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        checkout = checkoutModel.fromJson(response['data']['data']);
        Get.toNamed(AppRoutes.checkoutDetails);
      }
    }
    update();
  }

  getTotalDiscount() {
    for (int i = 0; i < checkout.items!.length; i++) {
      totalItemsDiscount = checkout.items![i].discount!;
    }

    if (checkout.coupon != null) {
      totalItemsDiscount += checkout.coupon!.discount!;
    }
  }

  ConfirmOrder(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await checkoutData.ConfirmOrder(checkout.Id!, userToken!);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if (checkout.paymentMethod == "cash" ||
            checkout.paymentMethodType == "kiosk") {
          Get.offNamed(AppRoutes.checkoutCompelete,
              arguments: response['bill_reference']);
        } else if (checkout.paymentMethodType == "card" ||
            checkout.paymentMethodType == "valu" ||
            checkout.paymentMethodType == "wallet") {
          onlinePaymentURL =
              response['redirect_iframe_url'] ?? response["redirect_url"];
          Get.toNamed(AppRoutes.payment, arguments: onlinePaymentURL);
        }
      }
    }
    update();
  }

  @override
  void dispose() {
    mobileWallet.dispose();
    super.dispose();
  }
}
