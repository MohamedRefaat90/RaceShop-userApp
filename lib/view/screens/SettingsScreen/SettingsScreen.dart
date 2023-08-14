import 'package:ecommerce/controller/auth/login.dart';
import 'package:ecommerce/controller/settings/SettingsController.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImp());
    LoginControllerImp loginController = Get.put(LoginControllerImp());
    return ListView(children: [
      Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: Get.width / 1.5,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: AppColors.secondryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70))),
            child: Image.asset(
              'assets/images/settings/1.jpg',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: Get.width / 1.5,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70))),
          ),
          Positioned(
              bottom: -37,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: AppColors.white,
                    ),
                    borderRadius: BorderRadius.circular(50)),
                child: CircleAvatar(
                  minRadius: 50,
                  backgroundImage: AssetImage('assets/images/settings/4.jpg'),
                ),
              ))
        ],
      ),
      SizedBox(height: 40),
      GetBuilder<SettingsControllerImp>(builder: (controller) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
                child: Column(children: [
              settingsFeatrue(
                  title: 'Notifications',
                  trailing: Switch.adaptive(
                      value: controller.notificationEnable,
                      onChanged: (val) {
                        controller.notificationEnable = val;
                        controller.update();
                      }),
                  press: () {}),
              settingsFeatrue(
                  title: "Address",
                  trailing: Icon(Icons.location_pin),
                  press: () {}),
              settingsFeatrue(
                  title: "About us",
                  trailing: Icon(Icons.info_outline),
                  press: () {}),
              settingsFeatrue(
                  title: "Contact us",
                  trailing: Icon(Icons.phone),
                  press: () {}),
              settingsFeatrue(
                  title: "Logout",
                  trailing: Icon(Icons.logout_outlined),
                  press: () {
                    loginController.logout();
                  }),
            ])));
      })
    ]);
  }
}

class settingsFeatrue extends GetView<SettingsControllerImp> {
  const settingsFeatrue({
    required this.title,
    required this.trailing,
    required this.press,
    super.key,
  });
  final String title;
  final Widget trailing;
  final Function()? press;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        trailing: trailing,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onTap: press);
  }
}
