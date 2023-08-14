import 'package:ecommerce/ApiLinks.dart';
import 'package:ecommerce/core/class/DB_helper.dart';

class FavouriteData {
  DB_helper db_helper = DB_helper();
  FavouriteData(this.db_helper);

  addToFav(String productID, String userToken) async {
    var response = await db_helper
        .postData("${ApiLinks.Favourite}$productID", {}, userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }

  removeFromFav(String productID, String userToken) async {
    var response = await db_helper
        .patchData("${ApiLinks.Favourite}$productID", {}, userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }

  getFavProducts(String userToken) async {
    var response =
        await db_helper.getAllData(ApiLinks.myFav, userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }
}
