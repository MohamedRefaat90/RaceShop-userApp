import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/AppAssets.dart';

class AuthLoaing extends StatelessWidget {
  const AuthLoaing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(AppAssets.loading));
  }
}
