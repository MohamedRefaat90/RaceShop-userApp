// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/ApiLinks.dart';
import 'package:ecommerce/core/class/DB_helper.dart';

class DataTest {
  DB_helper db_helper;
  DataTest(
    this.db_helper,
  );

  getData() async {
    var response = await db_helper.postData(ApiLinks.confirmEmail, {});

    return response.fold((l) => l, (r) => r);
  }
}
