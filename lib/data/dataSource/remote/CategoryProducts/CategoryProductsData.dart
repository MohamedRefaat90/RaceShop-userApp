import 'package:ecommerce/ApiLinks.dart';
import 'package:ecommerce/core/class/DB_helper.dart';

class CategoryProductsData {
  DB_helper db_helper = DB_helper();
  CategoryProductsData(this.db_helper);

  // https://ecommerce-api-lrnu.onrender.com/api/v1/product?minPrice=29000&maxPrice=35000&sort=desc&categoryId=64ba6c4157750400327d310a
  getCategoryProductsData(
      {required String categoryID,
      double minPrice = 0,
      double maxPrice = 10000,
      String sort = 'desc',
      String? userToken}) async {
    var response = await db_helper.getAllData(
        "${ApiLinks.getAllProduct}categoryId=$categoryID&minPrice=$minPrice&maxPrice=$maxPrice&sort=$sort",
        userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }
}
