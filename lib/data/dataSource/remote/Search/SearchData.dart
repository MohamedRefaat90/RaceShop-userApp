import 'package:race_shop/ApiLinks.dart';
import 'package:race_shop/core/class/DB_helper.dart';

class SearchData {
  DB_helper db_helper;
  SearchData(this.db_helper);

  getSearchedData(String userToken, {required String searchedWord}) async {
    var response = await db_helper.getAllData(
        "${ApiLinks.getProducts}?search=$searchedWord",
        userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }
}
