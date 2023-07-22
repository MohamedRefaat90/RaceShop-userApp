import 'package:ecommerce/core/functions/alertExitApp.dart';
import 'package:flutter/material.dart';

import '../widgets/home/Searchbar_with_NotificationIcon.dart';
import '../widgets/home/offersBanar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
            onWillPop: () => AlertExitApp(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Searchbar_with_NotificationIcon(),
                  SizedBox(height: 10),
                  offersBanar()
                ],
              ),
            )),
      ),
    );
  }
}
