import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/constants/AppColors.dart';
import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/core/functions/flushBar.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/Model/CouponModel.dart';
import 'package:race_shop/data/dataSource/remote/Cart/CartData.dart';
import 'package:race_shop/data/dataSource/remote/Coupon/couponData.dart';
import 'package:race_shop/data/dataSource/remote/Product/productData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/snakbar.dart';

abstract class CartController extends GetxController {
  getCartProducts();
  upProductQuantity();
  downProductQuantity();
  addToCart(
      {required String productID,
      required String productName,
      required String productDecs,
      required String img,
      required int quantity,
      required String color,
      required String size});
  getProductData(String productID);
  removeFromCart(String productCartID, String productID);
  removeOneFromCart(productCartID);
  varifyCoupon(BuildContext context, String couponName);
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  ProductsData productsData = ProductsData(Get.find());
  CouponData couponData = CouponData(Get.find());
  MyServices myServices = Get.find();
  late String userToken;
  int productQuantity = 1;
  Map cartInfo = {};
  List cartProducts = [];
  int totalPrice = 0;
  StatusRequest? statusRequest;
  late num cartQuantity = 0;
  late num cartDiscount = 0;
  double opacity1 = 0;
  double opacity2 = 1;
  double transform = 100;
  CouponModel? coupon;
  int couponDiscount = 0;
  TextEditingController? couponName;

  @override
  void onInit() {
    userToken = myServices.sharedPreferences.getString('userToken')!;
    couponName = TextEditingController();
    getCartProducts();
    super.onInit();
  }

  haveCoupon() {
    opacity1 = 1;
    transform = 0;
    opacity2 = 0;
    update();
  }

  notHaveCoupon() {
    opacity1 = 0;
    transform = 100;
    opacity2 = 1;
    update();
  }

  @override
  upProductQuantity() {
    productQuantity++;
    update();
  }

  @override
  downProductQuantity() {
    if (productQuantity > 1) {
      productQuantity--;
      update();
    }
  }

  @override
  getCartProducts() async {
    cartQuantity = 0;
    cartDiscount = 0;
    cartProducts.clear();
    statusRequest = StatusRequest.loading;

    update();

    var response = await cartData.getCartProducts(userToken);

    statusRequest = handelData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        cartInfo = response['data']['data'];
        totalPrice = cartInfo['totalPrice'].toInt();
        // cartLength = cartInfo['items'].length;
        for (int i = 0; i < cartInfo['items'].length; i++) {
          await getProductData(cartInfo['items'][i]['product']);
          cartQuantity = cartQuantity + cartInfo['items'][i]['quantity'];
          cartDiscount = cartDiscount + cartInfo['items'][i]['discount'];
        }
        if (cartInfo['items'].isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      }
    }

    update();
  }

  @override
  addToCart(
      {required productID,
      required productName,
      required productDecs,
      required img,
      required quantity,
      required color,
      required size}) async {
    statusRequest = StatusRequest.none;
    update();
    var response = await cartData.addToCart(
        productID: productID,
        productName: productName,
        productDesc: productDecs,
        img: img,
        quantity: quantity,
        color: color,
        size: size,
        userToken: userToken);

    statusRequest = handelData(response);
    print(Get.currentRoute);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        snakBar(
            message: "ItemAddedToCart".tr,
            color: Colors.green,
            btn: Get.currentRoute != "/cart"
                ? TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.cart);
                      // cartQuantity = 0;
                      getCartProducts();
                      // updateCart();
                    },
                    child: Text("ViewCart".tr,
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)))
                : SizedBox());
      }
    } else {
      snakBar(
          message: "ThereisNoMoreQuintityForThisProduct".tr, color: Colors.red);
    }
  }

  @override
  getProductData(productID) async {
    var response = await cartData.getProductData(productID, userToken);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        cartProducts.add(response['data']['data']);
      }
    }
  }

  @override
  removeFromCart(productCartID, productID) async {
    statusRequest = StatusRequest.none;
    update();
    await cartData.removeFromCart(productCartID, userToken);
    cartProducts.removeWhere((e) => e['id'] == productID);
    updateCart();

    snakBar(message: "ProductRemovedFromYourCart".tr);

    if (cartInfo['items'].isEmpty) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  removeOneFromCart(productCartID) async {
    statusRequest = StatusRequest.none;
    update();
    await cartData.removeOneFromCart(productCartID, userToken);
    updateCart();

    Get.showSnackbar(GetSnackBar(
      message: "ProductRemovedFromYourCart".tr,
      duration: Duration(seconds: 2),
    ));

    if (cartInfo['items'].isEmpty) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  varifyCoupon(BuildContext context, String couponName) async {
    statusRequest = StatusRequest.none;
    update();

    var response = await couponData.varifyCoupon(couponName, userToken);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        coupon = CouponModel.fromJson(response['data']['data']);
        couponDiscount = coupon!.discount ?? 0;
      }
    } else {
      statusRequest = StatusRequest.success;
      flushBar(context, message: "CouponNotValid".tr, color: Colors.red);
    }

    update();
  }

  cancelCoupon() {
    coupon = null;
    couponDiscount = 0;
    couponName!.clear();
    update();
  }

  updateCart() async {
    var response = await cartData.getCartProducts(userToken);

    statusRequest = StatusRequest.success;

    cartInfo = response['data']['data'];
    totalPrice = cartInfo['totalPrice'].toInt();
    cartQuantity = 0;
    for (int i = 0; i < cartInfo['items'].length; i++) {
      cartQuantity = cartQuantity + cartInfo['items'][i]['quantity'];
      cartDiscount = cartDiscount + cartInfo['items'][i]['discount'];
    }

    if (cartInfo['items'].isEmpty) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  goToCheckoutPage() {
    Get.toNamed(AppRoutes.checkout);
  }

  @override
  void dispose() {
    couponName!.dispose();
    super.dispose();
  }
}
