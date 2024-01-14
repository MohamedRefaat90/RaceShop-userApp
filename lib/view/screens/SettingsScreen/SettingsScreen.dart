import 'package:race_shop/controller/LanguageController/LanguageController.dart';
import 'package:race_shop/controller/auth/login.dart';
import 'package:race_shop/controller/home/HomeController.dart';
import 'package:race_shop/core/constants/AppAssets.dart';
import 'package:race_shop/core/constants/AppColors.dart';
import 'package:race_shop/core/constants/AppRoutes.dart';
import 'package:race_shop/core/constants/AppTheme.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/core/shared/BTN.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/settings/SettingsController.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    LoginController loginController = Get.put(LoginController());
    SharedPreferences userData = Get.find<MyServices>().sharedPreferences;
    LanguageController languageController = Get.find();
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
            child: Image.asset('assets/images/settings/1.jpg',
                fit: BoxFit.contain),
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
      Center(
          child: Text(
              "${userData.getString("fName")} ${userData.getString("lName")}",
              style: TextStyle(fontWeight: FontWeight.bold))),
      Center(child: Text("UID : ${userData.getString("Uid")}")),
      SizedBox(height: 0),
      GetBuilder<SettingsController>(builder: (controller) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
                child: Column(children: [
              settingsFeatrue(
                  title: "OrdersHistory".tr,
                  trailing: Icon(Icons.watch_later_rounded),
                  press: () {
                    Get.toNamed(AppRoutes.ordersHistory);
                  }),
              settingsFeatrue(
                  title: "Address".tr,
                  trailing: Icon(Icons.location_pin),
                  press: () {
                    Get.toNamed(AppRoutes.addressView);
                  }),
              settingsFeatrue(
                  title: "Aboutus".tr,
                  trailing: Icon(Icons.info_outline),
                  press: () {}),
              // settingsFeatrue(
              //     title: "Contact us",
              //     trailing: Icon(Icons.phone),
              //     press: () {}),
              ExpansionTile(
                title: Text("Contactus".tr),
                trailing: Icon(Icons.phone),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BTN(
                          widget: Row(
                            children: [
                              Icon(Icons.phone),
                              SizedBox(width: 5),
                              Text('Calling'.tr)
                            ],
                          ),
                          color: Colors.blue,
                          padding: 16,
                          press: () {
                            launchUrl(
                                Uri.parse("tel:${controller.phoneOwner}"));
                          }),
                      SizedBox(width: 20),
                      BTN(
                          widget: Row(
                            children: [
                              SvgPicture.asset(AppAssets.whatsappIcon,
                                  width: 20, color: AppColors.white),
                              SizedBox(width: 10),
                              Text('WhatsApp'.tr),
                            ],
                          ),
                          color: Colors.green,
                          padding: 16,
                          press: () {
                            launchUrl(Uri.parse(
                                "https://wa.me/${controller.whatsappOwner}"));
                          }),
                    ],
                  )
                ],
              ),
              settingsFeatrue(
                  title: 'DarkMode'.tr,
                  trailing: Switch.adaptive(
                      value: controller.isDarkMode!,
                      onChanged: (val) => controller.ToggelDarkMode(val)),
                  press: () {}),
              ExpansionTile(
                title: Text("Languages".tr),
                trailing: Icon(Icons.language),
                childrenPadding: EdgeInsets.all(10),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BTN(
                          widget: Text('Arabic'.tr),
                          width: 100,
                          color: AppColors.primaryColor,
                          padding: 16,
                          press: () => languageController.changeLanguage('ar')),
                      SizedBox(width: 20),
                      BTN(
                          widget: Text('English'.tr),
                          width: 100,
                          color: AppColors.primaryColor,
                          padding: 16,
                          press: () => languageController.changeLanguage('en')),
                    ],
                  )
                ],
              ),
              settingsFeatrue(
                  title: "Logout".tr,
                  color: Colors.red,
                  trailing: Icon(Icons.logout_outlined, color: Colors.red),
                  press: () => loginController.logout()),
            ])));
      })
    ]);
  }
}

class settingsFeatrue extends GetView<SettingsController> {
  settingsFeatrue(
      {required this.title,
      required this.trailing,
      required this.press,
      this.color,
      super.key});
  final String title;
  final Widget trailing;
  final Function()? press;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: TextStyle(color: color)),
        trailing: trailing,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onTap: press);
  }
}
