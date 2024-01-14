import '../../../../ApiLinks.dart';
import '../../../../core/class/DB_helper.dart';

class UserData {
  DB_helper db_helper;
  UserData(this.db_helper);

  getUserData(String userToken) async {
    var response =
        await db_helper.getAllData(ApiLinks.user, userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }
}
