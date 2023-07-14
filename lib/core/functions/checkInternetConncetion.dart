import 'dart:io';

Future checkInternetConnection() async {
  try {
    List<InternetAddress> response = await InternetAddress.lookup('google.com');
    if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
