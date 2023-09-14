import 'package:ecommerce/core/class/DB_helper.dart';

class CategoriesData {
  DB_helper db_helper;
  CategoriesData(this.db_helper);

  getCategories(String url) async {
    var response = await db_helper.getAllData(url);

    return response.fold((l) => l, (r) => r);
  }
}
