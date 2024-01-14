import 'package:race_shop/ApiLinks.dart';
import 'package:race_shop/core/class/DB_helper.dart';

class CouponData {
  DB_helper db_helper;

  CouponData(this.db_helper);

  varifyCoupon(String couponName, String userToken) async {
    var response = await db_helper.getAllData(
        "${ApiLinks.varifyCoupon}$couponName",
        userToken: userToken);
    return response.fold((l) => l, (r) => r);
  }
}
