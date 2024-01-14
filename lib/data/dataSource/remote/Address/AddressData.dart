import 'package:race_shop/ApiLinks.dart';
import 'package:race_shop/core/class/DB_helper.dart';

class AddressData {
  DB_helper db_helper;

  AddressData(this.db_helper);

  addAddress(
      {required String AddressName,
      required String city,
      required String street,
      required String buildingNumber,
      required String floorNumber,
      required String apartmentNumber,
      required double lat,
      required double long,
      required String userToken}) async {
    var response = await db_helper.postData(
        ApiLinks.addAddress,
        {
          "address": {
            "name": AddressName,
            "city": city,
            "street": street,
            "buildingNumber": buildingNumber,
            "floorNumber": floorNumber,
            "apartmentNumber": apartmentNumber,
            "coordinates": [long, lat]
          }
        },
        userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }

  removeAddress(String userToken, String addressID) async {
    var response = await db_helper.deleteData(
        "${ApiLinks.removeAddess}/$addressID", userToken);

    return response.fold((l) => l, (r) => r);
  }

  getAddress(String userToken) async {
    var response =
        await db_helper.getAllData(ApiLinks.user, userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }

  getDeliveryZoneData(String userToken) async {
    var response =
        await db_helper.getAllData(ApiLinks.deliveryZone, userToken: userToken);

    return response.fold((l) => l, (r) => r);
  }
}
