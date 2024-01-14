import 'package:race_shop/core/class/statusRequest.dart';
import 'package:race_shop/core/constants/AppColors.dart';
import 'package:race_shop/core/functions/flushBar.dart';
import 'package:race_shop/core/functions/handelDataController.dart';
import 'package:race_shop/core/services/myServices.dart';
import 'package:race_shop/data/Model/userModel.dart';
import 'package:race_shop/data/dataSource/remote/Address/AddressData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';

class AddressAddController extends GetxController {
  late MapController mapController;
  late List<GeoPoint> location = [];
  bool mapIsReady = false;
  late GeoPoint initLocation;
  late TextEditingController AddressName;
  late TextEditingController Street;
  late TextEditingController floorNum;
  late TextEditingController ApartmentNum;
  late TextEditingController BuildingNum;
  late String? City;
  AddressData addressData = AddressData(Get.find());
  StatusRequest? statusRequest;
  MyServices myServices = Get.find();
  late String userToken;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  userModel? userData;
  double isAddressDialogVisible = 1020;
  bool isAddressDialogActive = false;
  double opacity = 1;
  final GlobalKey barrierKey = GlobalKey();
  List deliveryZoneList = [];
  late String selectedDeliveryZoneID;
  dynamic deliveryZone;
  String? selectedDeliveryZone;
  @override
  void onInit() {
    mapController = MapController(
        initMapWithUserPosition:
            UserTrackingOption(enableTracking: false, unFollowUser: true));

    userToken = myServices.sharedPreferences.getString('userToken')!;
    getDeliveryZone();
    AddressName = TextEditingController();
    Street = TextEditingController();
    BuildingNum = TextEditingController();
    floorNum = TextEditingController();
    ApartmentNum = TextEditingController();

//  Create Marker when Map is open
    mapController.listenerRegionIsChanging.addListener(() async {
      initLocation = await mapController.listenerRegionIsChanging.value!.center;
      if (location.length < 1) {
        mapController.addMarker(GeoPoint(
            latitude: initLocation.latitude,
            longitude: initLocation.longitude));
        location.add(initLocation);
      }
    });
//  Create Marker when Click on Map
    mapController.listenerMapSingleTapping.addListener(() async {
      if (location.length < 1) {
        mapController.addMarker(mapController.listenerMapSingleTapping.value!);
        location.add(mapController.listenerMapSingleTapping.value!);
      } else {
        mapController.removeMarkers(location);
        location.clear();
      }
    });

    super.onInit();
  }

  Future<void> OpenAddressDetailsDialog(BuildContext context) async {
    if (location.isNotEmpty) {
      isAddressDialogVisible = 0;
      opacity = 1;
      isAddressDialogActive = true;
      update();
    } else {
      flushBar(context,
          message: "PickaLocationtoContinue".tr,
          color: AppColors.secondryColor);
    }
  }

  CloseAddressDetailsDialog() {
    isAddressDialogVisible = 500;
    opacity = 0;
    isAddressDialogActive = false;
    update();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.addAddress(
        AddressName: AddressName.text,
        city: selectedDeliveryZone!,
        street: Street.text,
        buildingNumber: BuildingNum.text,
        floorNumber: floorNum.text,
        apartmentNumber: ApartmentNum.text,
        lat: location[0].latitude,
        long: location[0].longitude,
        userToken: userToken);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        var data = response['data']['data'];
        userData = userModel.fromJson(data);
      }
    }

    update();
  }

  MapIsReady(bool isReady) {
    mapIsReady = isReady;
    update();
  }

  getDeliveryZone() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.getDeliveryZoneData(userToken);

    statusRequest = handelData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        var responseData = response["data"]["data"];

        deliveryZoneList.addAll(responseData);

        update();
      }
    }

    update();
  }

  getDeliveryZoneID(dynamic city) {
    deliveryZone = city;
    selectedDeliveryZone = city['zoneName_en'];
    selectedDeliveryZoneID = city["_id"];

    update();
  }

  @override
  void dispose() {
    mapController.dispose();
    AddressName.dispose();
    Street.dispose();
    floorNum.dispose();
    ApartmentNum.dispose();
    BuildingNum.dispose();
    super.dispose();
  }
}
