import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_options.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    // FirebaseMessaging messaging = FirebaseMessaging.instance;

    // await messaging.requestPermission();
    // String? token = await messaging.getToken();
    // print(token);

    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    return this;
  }
}

initServices() async {
  await Get.putAsync(() => MyServices().init());
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.notification!.title}");
//   print("Handling a background message: ${message.notification!.body}");
//   print("Handling a background message: ${message.data}");
// }
