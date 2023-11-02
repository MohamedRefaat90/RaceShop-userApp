import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:ecommerce/controller/auth/login.dart';
import 'package:ecommerce/controller/settings/SettingsController.dart';
import 'package:ecommerce/core/constants/AppAssets.dart';
import 'package:ecommerce/core/constants/AppColors.dart';
import 'package:ecommerce/core/constants/AppRoutes.dart';
import 'package:ecommerce/core/shared/BTN.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
      GetBuilder<SettingsControllerImp>(builder: (controller) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
                child: Column(children: [
              // settingsFeatrue(
              //     title: 'Notifications',
              //     trailing: Switch.adaptive(
              //         value: controller.notificationEnable,
              //         onChanged: (val) {
              //           controller.notificationEnable = val;
              //           controller.update();
              //         }),
              //     press: () {}),
              // settingsFeatrue(
              //     title: "Orders",
              //     trailing: Icon(Icons.shopping_bag),
              //     press: () {
              //       Get.toNamed(AppRoutes.orders);
              //     }),
              settingsFeatrue(
                  title: "Orders History",
                  trailing: Icon(Icons.watch_later_rounded),
                  press: () {
                    Get.toNamed(AppRoutes.ordersHistory);
                  }),
              settingsFeatrue(
                  title: "Address",
                  trailing: Icon(Icons.location_pin),
                  press: () {
                    Get.toNamed(AppRoutes.addressView);
                  }),
              settingsFeatrue(
                  title: "About us",
                  trailing: Icon(Icons.info_outline),
                  press: () {}),
              // settingsFeatrue(
              //     title: "Contact us",
              //     trailing: Icon(Icons.phone),
              //     press: () {}),
              ExpansionTile(
                title: Text("Contact us"),
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
                              Text('Calling')
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
                              Text('WhatsApp'),
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
