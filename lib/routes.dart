import 'package:ecommerce/core/Middleware/middleware.dart';
import 'package:ecommerce/view/screens/Languages.dart';
import 'package:ecommerce/view/screens/auth/fogetPassword/VarificationCode.dart';
import 'package:ecommerce/view/screens/auth/fogetPassword/resetPassword.dart';
import 'package:ecommerce/view/screens/auth/fogetPassword/successResetPass.dart';
import 'package:ecommerce/view/screens/auth/login.dart';
import 'package:ecommerce/view/screens/auth/signup/checkEmail.dart';
import 'package:ecommerce/view/screens/auth/signup/signup.dart';
import 'package:ecommerce/view/screens/auth/signup/successSignup.dart';
import 'package:ecommerce/view/screens/home.dart';
import 'package:ecommerce/view/screens/onBoardingScreen.dart';
import 'package:get/get.dart';
import 'core/constants/AppRoutes.dart';
import 'view/screens/auth/fogetPassword/forgetPassword.dart';

List<GetPage<dynamic>>? routes = [
  // ================== Languages ==================
  GetPage(
      name: '/', page: () => const Languages(), middlewares: [Middleware()]),

  // ================== onBoarding ==================
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoardingScreen()),

  // ===================== Auth =====================
  GetPage(name: AppRoutes.login, page: () => const Login()),
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

  GetPage(name: AppRoutes.home, page: () => const Home()),
];
