import 'package:race_shop/core/Middleware/middleware.dart';
import 'package:race_shop/view/screens/AdressScreen/addressAdd.dart';
import 'package:race_shop/view/screens/AdressScreen/addressView.dart';
import 'package:race_shop/view/screens/Cart/CartScreen.dart';
import 'package:race_shop/view/screens/Checkout/checkout.dart';
import 'package:race_shop/view/screens/LanguageScreen/Languages.dart';
import 'package:race_shop/view/screens/CheckoutDetails/CheckoutDetailsScreen.dart';
import 'package:race_shop/view/screens/PaymentScreen/PaymentScreen.dart';
import 'package:race_shop/view/screens/auth/fogetPassword/VarificationCode.dart';
import 'package:race_shop/view/screens/auth/fogetPassword/resetPassword.dart';
import 'package:race_shop/view/screens/auth/fogetPassword/successResetPass.dart';
import 'package:race_shop/view/screens/auth/Login/login.dart';
import 'package:race_shop/view/screens/auth/signup/checkEmail.dart';
import 'package:race_shop/view/screens/auth/signup/signup.dart';
import 'package:race_shop/view/screens/auth/signup/successSignup.dart';
import 'package:race_shop/view/screens/categoryProductsScreen/categoryProducts.dart';
import 'package:race_shop/view/screens/homeNavigationScreen/homeNavigationScreen.dart';
import 'package:race_shop/view/screens/onBoardingScreen/onBoardingScreen.dart';
import 'package:race_shop/view/screens/CheckoutCompelete/CheckoutCompeleteScreen.dart';
import 'package:race_shop/view/screens/productDetailsScreen/productDetails.dart';
import 'package:race_shop/view/test.dart';
import 'package:get/get.dart';
import 'core/constants/AppRoutes.dart';
import 'view/screens/Notifications/NotificationsScreen.dart';
import 'view/screens/Offers/offersScreen.dart';
import 'view/screens/OrdersHistory/ordersHistoryScreen.dart';
import 'view/screens/OrdersScreen/OrdersScreen.dart';
import 'view/screens/auth/fogetPassword/forgetPassword.dart';
import 'view/screens/orderDetails/OrderDetailsScreen.dart';

List<GetPage<dynamic>>? routes = [
  // ================== Languages ==================
  GetPage(
      name: '/',
      page: () => const Languages(),
      middlewares: [LanguageMiddleware()]),

  // ================== onBoarding ==================
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoardingScreen()),

  // ===================== Auth =====================
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.signup, page: () => const Signup()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const forgetPassword()),
  GetPage(
      name: AppRoutes.varificationCode, page: () => const varificationCode()),
  GetPage(name: AppRoutes.restPassword, page: () => const resetPassword()),
  GetPage(
      name: AppRoutes.successResetPass, page: () => const SuccessResetPass()),
  GetPage(name: AppRoutes.successSignup, page: () => const SuccessSignup()),
  GetPage(name: AppRoutes.checkEmail, page: () => const CheckEmail()),

  // ===================== Home =====================

  GetPage(
      name: AppRoutes.home,
      page: () => const HomeNavigationScreen(),
      middlewares: [LoginMiddleware()]),
  GetPage(
      name: AppRoutes.categoryProduts, page: () => const CategoryProducts()),
  GetPage(name: AppRoutes.productDetails, page: () => ProductDetails()),
  GetPage(name: AppRoutes.cart, page: () => const CartScreen()),

// ================= Address =================
  GetPage(
      name: AppRoutes.addressView,
      page: () => const AddressView(),
      transition: Transition.downToUp),

  GetPage(
      name: AppRoutes.addressAdd,
      page: () => const AddressAdd(),
      transition: Transition.fadeIn),

  // ================= Checkout =================
  GetPage(
      name: AppRoutes.checkout,
      page: () => const Checkout(),
      transition: Transition.upToDown),

// ================= Checkout Detials =================
  GetPage(
      name: AppRoutes.checkoutDetails,
      page: () => const CheckoutDetailsScreen()),

// ================= Payment =================
  GetPage(name: AppRoutes.payment, page: () => const PaymentScreen()),

// ================= Checkout Compelete =================
  GetPage(
      name: AppRoutes.checkoutCompelete,
      page: () => const checkoutCompeleteScreen()),

// ================= Orders =================
  GetPage(name: AppRoutes.orders, page: () => const OrdersScreen()),

// ================= Orders Details=================
  GetPage(
      name: AppRoutes.ordersDetails,
      page: () => const OrderDetailsScreen(),
      transition: Transition.zoom),

// ================= Orders History =================
  GetPage(
      name: AppRoutes.ordersHistory,
      page: () => const OrdersHistoryScreen(),
      transition: Transition.rightToLeftWithFade),

// ================= Offres =================
  GetPage(
      name: AppRoutes.offers,
      page: () => const OffersScreen(),
      transition: Transition.rightToLeftWithFade),

// ================= Notifications =================
  GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsScreen(),
      transition: Transition.downToUp),

// ================= test =================
  GetPage(name: AppRoutes.test, page: () => const Test()),
];
