import 'package:ecommerce/ApiLinks.dart';
import 'package:ecommerce/core/class/DB_helper.dart';

class HomeData {
  DB_helper db_helper;

  HomeData(this.db_helper);

  getAllData() async {
    var response = await db_helper.getAllData(ApiLinks.categories);

    return response.fold((l) => l, (r) => r);
  }
}
