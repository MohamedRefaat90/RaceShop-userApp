import 'package:race_shop/ApiLinks.dart';
import 'package:race_shop/core/class/DB_helper.dart';

class offersData {
  DB_helper db_helper;

  offersData(this.db_helper);

  getOffersProducts() async {
    var response = await db_helper.getAllData(
        "${ApiLinks.getProducts}?discount=true&sort=desc&sortBy=createdAt&page=1&limit=20");

    return response.fold((l) => l, (r) => r);
  }
}
