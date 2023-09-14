import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handelDataController.dart';
import 'package:ecommerce/core/services/myServices.dart';
import 'package:ecommerce/data/dataSource/remote/Cart/CartData.dart';
import 'package:ecommerce/data/dataSource/remote/Product/productData.dart';
import 'package:ecommerce/view/widgets/productDetails/productDesc.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  getCartProducts();
  upProductQuantity();
  downProductQuantity();
  addToCart(
      {required String productID,
      required String productName,
      required String productDecs,
      required int quantity,
      required String color,
      required String size});
  getProductData(String productID);
  removeFromCart(String productCartID, String productID);
  removeOneFromCart(productCartID);
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  ProductsData productsData = ProductsData(Get.find());
  MyServices myServices = Get.find();
  late String userToken;
  int productQuantity = 1;
  Map cartInfo = {};
  List cartProducts = [];
  int totalPrice = 0;
  StatusRequest? statusRequest;
  late num cartQuantity = 0;
  late num cartDiscount = 0;

  @override
  void onInit() {
    userToken = myServices.sharedPreferences.getString('userToken')!;
    getCartProducts();
    super.onInit();
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
    statusRequest = StatusRequest.loading;

    update();

    var response = await cartData.getCartProducts(userToken);

    statusRequest = handelData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        cartInfo = response['data']['data'];
        totalPrice = cartInfo['totalPrice'];
        for (int i = 0; i < cartInfo['items'].length; i++) {
          await getProductData(cartInfo['items'][i]['product']);
          cartQuantity = cartQuantity + cartInfo['items'][i]['quantity'];
          cartDiscount = cartDiscount + cartInfo['items'][i]['discount'];
        }
      }
    }

    if (cartInfo['items'].isEmpty) {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  addToCart(
      {required productID,
      required productName,
      required productDecs,
      required quantity,
      required color,
      required size}) async {
    // statusRequest = StatusRequest.loading;

    // update();

    var response = await cartData.addToCart(
        productID: productID,
        productName: productName,
        productDesc: productDecs,
        quantity: quantity,
        color: color,
        size: size,
        userToken: userToken);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.showSnackbar(GetSnackBar(
          message: response['message'],
          duration: Duration(seconds: 2),
        ));
      } else {
        Get.showSnackbar(GetSnackBar(
          message: response['message'],
          duration: Duration(seconds: 2),
        ));
      }
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

    Get.showSnackbar(GetSnackBar(
      message: "Product Remove Successfully From Your Cart",
      duration: Duration(seconds: 2),
    ));

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
      message: "Product Remove Successfully From Your Cart",
      duration: Duration(seconds: 2),
    ));

    if (cartInfo['items'].isEmpty) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  updateCart() async {
    var response = await cartData.getCartProducts(userToken);

    statusRequest = StatusRequest.success;

    cartInfo = response['data']['data'];
    totalPrice = cartInfo['totalPrice'];
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
}
