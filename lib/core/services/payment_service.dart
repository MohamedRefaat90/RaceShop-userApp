import 'package:race_shop/data/Model/paymobAuthTokenModel.dart';

import '../class/DB_helper.dart';

class PaymentService {
  final DB_helper db_helper;

  PaymentService({required this.db_helper});

  Future getTokenformPaymob() async {
    var response = await db_helper.postData(
        "https://accept.paymob.com/api/auth/tokens",
        PaymobAuthTokenModel.toJson());

    return response.fold((l) => l, (r) => r["token"]);
  }
}
