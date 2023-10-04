import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';

import '../../../controller/address/addressAddController.dart';
import '../../../core/constants/AppColors.dart';

class OSmap extends GetView<AddressAddController> {
  const OSmap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
        controller: controller.mapController,
        mapIsLoading: Center(
            child: CircularProgressIndicator(
                color: AppColors.secondryColor, strokeWidth: 5)),
        onMapIsReady: (value) {
          controller.MapIsReady(value);
          print(value);
          controller.update();
        },
        osmOption: OSMOption(
          markerOption: MarkerOption(
              defaultMarker: MarkerIcon(
                  icon: Icon(Icons.location_pin,
                      size: 50, color: Colors.redAccent))),
          userLocationMarker: UserLocationMaker(
              personMarker: MarkerIcon(
                iconWidget:
                    Icon(Icons.location_pin, color: Colors.red, size: 150),
              ),
              directionArrowMarker: MarkerIcon(
                iconWidget:
                    Icon(Icons.location_pin, size: 150, color: Colors.red),
              )),
          zoomOption: ZoomOption(
              initZoom: 15, minZoomLevel: 3, maxZoomLevel: 19, stepZoom: 1.0),
        ));
  }
}
