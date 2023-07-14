import 'package:ecommerce/view/screens/auth/fogetPassword/VarificationCode.dart';
import 'package:ecommerce/view/screens/auth/fogetPassword/resetPassword.dart';
import 'package:ecommerce/view/screens/auth/fogetPassword/successResetPass.dart';
import 'package:ecommerce/view/screens/auth/login.dart';
import 'package:ecommerce/view/screens/auth/signup/checkEmail.dart';
import 'package:ecommerce/view/screens/auth/signup/signup.dart';
import 'package:ecommerce/view/screens/auth/signup/successSignup.dart';
import 'package:ecommerce/view/screens/onBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'core/constants/AppRoutes.dart';
import 'view/screens/auth/fogetPassword/forgetPassword.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // Auth
  AppRoutes.login: (context) => const Login(),
  AppRoutes.signup: (context) => const Signup(),
  AppRoutes.forgetPassword: (context) => const forgetPassword(),
  AppRoutes.varificationCode: (context) => const varificationCode(),
  AppRoutes.restPassword: (context) => const resetPassword(),
  AppRoutes.successResetPass: (context) => const SuccessResetPass(),
  AppRoutes.successSignup: (context) => const SuccessSignup(),
  AppRoutes.checkEmail: (context) => const CheckEmail(),

  // onBoa
  AppRoutes.onBoarding: (context) => const OnBoardingScreen(),
};
