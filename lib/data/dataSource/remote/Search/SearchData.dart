import 'package:ecommerce/ApiLinks.dart';
import 'package:ecommerce/core/class/DB_helper.dart';

class SearchData {
  DB_helper db_helper;
  SearchData(this.db_helper);

  getSearchedData(String userToken, {required String searchedWord}) async {
    var response = await db_helper.getAllData(
        "${ApiLinks.getProducts}?categoryId=64c2aba0c51c16003246cd73&search=$searchedWord",
        userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }
}
