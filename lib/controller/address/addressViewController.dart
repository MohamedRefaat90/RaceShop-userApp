import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/Model/userModel.dart';
import 'package:race_shop/data/dataSource/remote/Address/AddressData.dart';
import 'package:get/get.dart';

import '../../data/Model/DeliveryZoneModel.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  StatusRequest? statusRequest;
  MyServices myServices = Get.find();
  late String userToken;
  List addressList = [];

  @override
  void onInit() {
    userToken = myServices.sharedPreferences.getString("userToken")!;
    getAllAddresses();

    super.onInit();
  }

  getAllAddresses() async {
    addressList.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.getAddress(userToken);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        var responseData = response['data']['data']['address'];

        addressList.addAll(responseData.map((e) => AddressModel.fromJson(e)));
        update();
      }
    }

    update();
  }

  removeAddress(String addressID) async {
    addressData.removeAddress(userToken, addressID);
    addressList.removeWhere((element) => element.Id == addressID);
    update();
  }
}
